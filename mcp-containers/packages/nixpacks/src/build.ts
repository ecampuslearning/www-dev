import { delay } from '@metorial-mcp-containers/delay';
import { readManifest } from '@metorial-mcp-containers/manifest';
import { getTempDir } from '@metorial-mcp-containers/temp-dir';
import { $ } from 'bun';
import fs from 'fs-extra';
import path from 'path';
import { ensureNixDir } from './nixDir';
import { getNixpacksEnv, getNixpacksOptions } from './options';

export let getContainerName = (id: string) => {
  return `ghcr.io/metorial/mcp-container--${id.replaceAll('/', '--')}`.toLowerCase();
};

export let nixpacksBuild = async (
  id: string,
  version: string,
  opts: {
    platform?: string;
    publish?: boolean;
    out?: string;
    ci?: boolean;
    export?: string;
  }
) => {
  if (opts.out && opts.ci) {
    throw new Error('Cannot use out and ci together');
  }

  if (opts.ci && !opts.platform) {
    throw new Error('Cannot use ci without platform');
  }

  console.log(`Building ${id} (${version})...`);

  let manifest = await readManifest(id);
  let buildDir = await ensureNixDir(id, version);

  if (manifest.build?.buildDir) {
    buildDir = path.join(buildDir, manifest.build.buildDir);
  }

  let name = getContainerName(id);

  let labels = {
    source: manifest.repo.url,
    publisher: 'Metorial'
  };

  let tags = opts.ci
    ? [`${name}:${version}-${opts.platform!.replace('linux/', '')}`]
    : [`${name}:${version}`, `${name}:latest`];

  let cmd: string[] = ['nixpacks', 'build', '.'];
  cmd.push('--name', name);
  if (opts.platform && !opts.ci) cmd.push('--platform', opts.platform);
  if (opts.out) cmd.push('--out', opts.out);
  for (let tag of tags) cmd.push('--tag', tag);
  for (let [key, value] of Object.entries(labels)) {
    cmd.push('--label', `org.opencontainers.image.${key}=${value}`);
  }
  if (opts.ci) cmd.push('--out', buildDir);

  cmd.push(...(await getNixpacksOptions(buildDir, manifest)));

  // Run Nixpacks build
  console.log(`Running: ${cmd.join(' ')}`);

  let proc = Bun.spawn({
    cmd,
    cwd: buildDir,
    stdout: 'inherit',
    stderr: 'inherit',
    env: getNixpacksEnv(manifest)
  });

  await proc.exited;

  if (proc.exitCode !== 0) {
    throw new Error(`Failed to build ${id} (${version})`);
  }

  // Build the image manually if ci is set
  if (opts.ci) {
    await delay(100);

    let buildxCreate = Bun.spawn({
      cmd: ['docker', 'buildx', 'create', '--use'],
      cwd: buildDir,
      stdout: 'inherit',
      stderr: 'inherit',
      env: getNixpacksEnv(manifest)
    });
    await buildxCreate.exited;
    if (buildxCreate.exitCode !== 0) {
      throw new Error(`Failed to create buildx instance`);
    }

    let buildScript = (
      await fs.readFile(path.join(buildDir, '.nixpacks', 'build.sh'), 'utf-8')
    ).replace('docker build', 'docker buildx build');
    buildScript += ' --push --provenance false';

    console.log(`Running: ${buildScript}`);

    let ciProc = Bun.spawn({
      cmd: buildScript.split(' '),
      cwd: buildDir,
      stdout: 'inherit',
      stderr: 'inherit',
      env: getNixpacksEnv(manifest)
    });

    await ciProc.exited;
    if (ciProc.exitCode !== 0) {
      throw new Error(`Failed to build ${id} (${version})`);
    }
  }

  console.log(`Built ${id} (${version})`);

  // Test the image
  if (!opts.out) {
    let testCmd = ['docker', 'run', '--rm', '--interactive', tags[0]];

    console.log('Testing container');
    console.log(`Running: ${testCmd.join(' ')}`);

    let testRun = Bun.spawn({
      cmd: testCmd,
      cwd: buildDir,
      stdout: 'inherit',
      stderr: 'inherit'
    });

    await delay(2000);

    if (testRun.exitCode !== null) testRun.kill();

    try {
      testRun.disconnect();
    } catch (e) {}
  }

  // Publish the image
  if (opts.publish && !opts.ci) {
    console.log(`Publishing ${id} (${version})...`);

    for (let tag of tags) {
      let publishCmd = ['docker', 'push', tag];

      console.log(`Publishing: ${tag}`);
      console.log(`Running: ${publishCmd.join(' ')}`);

      let tryNumber = 0;
      let maxRetries = 5;

      try {
        let publishProc = Bun.spawn({
          cmd: publishCmd,
          cwd: buildDir,
          stdout: 'inherit',
          stderr: 'inherit'
        });

        await publishProc.exited;

        if (publishProc.exitCode !== 0) {
          throw new Error(`Failed to publish ${id} (${version})`);
        }
      } catch (e) {
        if (tryNumber >= maxRetries) throw e;

        tryNumber++;
        await delay(2000 * tryNumber);
      }
    }

    console.log(`Published ${id} (${version})`);
  }

  // Export the image into a zip file
  if (opts.export) {
    console.log(`Exporting ${id} (${version})...`);

    let exportTempDir = await getTempDir('exp');

    let exportFile = path.resolve(process.cwd(), opts.export);
    await fs.ensureDir(path.dirname(exportFile));

    let tempContainerName = `temp-container-${Math.random().toString(36).substring(2, 15)}`;

    console.log('Creating temporary container');

    await $`docker create --name ${tempContainerName} ${tags[0]}`;
    await $`docker export ${tempContainerName} > ${path.join(
      exportTempDir,
      'image-filesystem.tar'
    )}`;
    await $`docker rm ${tempContainerName}`;

    console.log('Extracting image filesystem');

    let exportFsTempDir = path.join(exportTempDir, 'image-filesystem');
    await fs.mkdirp(exportFsTempDir);

    await $`tar -xf ${path.join(exportTempDir, 'image-filesystem.tar')} -C ${exportFsTempDir}`;

    // Only zip the app directory
    let appDir = path.join(exportFsTempDir, 'app');
    await $`zip -r ${exportFile} .`.cwd(appDir);

    console.log(`Exported ${id} (${version}) to ${exportFile}`);
  }
};
