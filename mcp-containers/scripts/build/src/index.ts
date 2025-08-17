import {
  getAllServers,
  getLatestServerVersion,
  readManifest
} from '@metorial-mcp-containers/manifest';
import { getContainerName, nixpacksBuild } from '@metorial-mcp-containers/nixpacks';
import { $ } from 'bun';
import fs from 'fs-extra';
import path from 'path';
import sade from 'sade';
import { getChunkedArray } from './chunks';

let prog = sade('build');

prog
  .command('single <serverId> [version]', undefined, { default: true })
  .option('--platform, -p', 'Platform to build for')
  .option('--publish, -P', 'Publish the image to the registry')
  .option('--export, -e', 'Export the image to a zip file')
  .action(
    async (
      serverId: string,
      version: string,
      opts: { platform?: string; publish?: boolean; export?: string }
    ) => {
      console.log(`Building ${serverId} (${version})...`);

      if (!version) {
        let versionData = await getLatestServerVersion(serverId);
        version = versionData.version;
      }

      await nixpacksBuild(serverId, version, {
        platform: opts.platform,
        publish: opts.publish,
        export: opts.export
      });

      process.exit(0);
    }
  );

prog
  .command('prepare <serverId> [version]')
  .option('--out, -o', 'Output directory')
  .action(async (serverId: string, version: string, opts: { out?: string }) => {
    if (!version) {
      let versionData = await getLatestServerVersion(serverId);
      version = versionData.version;
    }

    let out = opts.out ? path.resolve(opts.out) : path.join(process.cwd(), 'out');

    await nixpacksBuild(serverId, version, {
      out
    });

    process.exit(0);
  });

prog.command('get-latest-version <serverId>').action(async (serverId: string) => {
  let versionData = await getLatestServerVersion(serverId);
  console.log(versionData.version);
});

prog.command('get-build-platforms <serverId>').action(async (serverId: string) => {
  let serverData = await readManifest(serverId);
  console.log(serverData.build?.platforms?.join(',') ?? 'linux/amd64,linux/arm64');
});

prog
  .command('ci <serverId> <version>')
  .option('--platform, -p', 'Platform to build for')
  .option('--export, -e', 'Export the image to a zip file')
  .action(
    async (
      serverId: string,
      version: string,
      opts: { platform?: string; export?: string }
    ) => {
      await nixpacksBuild(serverId, version, {
        ci: true,
        publish: true,
        export: opts.export,
        platform: opts.platform
      });

      process.exit(0);
    }
  );

prog
  .command('ci-publish <serverId> <version>')
  .action(async (serverId: string, version: string) => {
    let serverData = await readManifest(serverId);
    let name = getContainerName(serverId);

    if (
      !serverData.build?.platforms ||
      (serverData.build?.platforms.includes('linux/arm64') &&
        serverData.build?.platforms.includes('linux/amd64'))
    ) {
      await $`docker manifest create ${name}:${version} \
      --amend ${name}:${version}-amd64 \
      --amend ${name}:${version}-arm64`;
      await $`docker manifest push ${name}:${version}`;

      await $`docker manifest create ${name}:latest \
    --amend ${name}:${version}-amd64 \
    --amend ${name}:${version}-arm64`;
      await $`docker manifest push ${name}:latest`;
    } else if (serverData.build?.platforms.includes('linux/arm64')) {
      await $`docker manifest create ${name}:${version} \
      --amend ${name}:${version}-arm64`;
      await $`docker manifest push ${name}:${version}`;

      await $`docker manifest create ${name}:latest \
      --amend ${name}:${version}-arm64`;
      await $`docker manifest push ${name}:latest`;
    } else if (serverData.build?.platforms.includes('linux/amd64')) {
      await $`docker manifest create ${name}:${version} \
      --amend ${name}:${version}-amd64`;
      await $`docker manifest push ${name}:${version}`;

      await $`docker manifest create ${name}:latest \
      --amend ${name}:${version}-amd64`;
      await $`docker manifest push ${name}:latest`;
    }

    process.exit(0);
  });

prog
  .command('all')
  .option('--platform, -p', 'Platform to build for')
  .option('--publish, -P', 'Publish the image to the registry')
  .option('--only', 'Path to file with server IDs to build')
  .action(async (opts: { platform?: string; publish?: boolean; only?: string }) => {
    let servers = await getAllServers();

    let buildOutputFile = path.join(process.cwd(), 'build.md');
    await fs.writeFile(buildOutputFile, '');

    if (opts.only) {
      let only = new Set(
        (await fs.readFile(path.resolve(opts.only), 'utf-8'))
          .split('\n')
          .map(t => t.trim())
          .filter(Boolean)
      );

      servers = servers.filter(server => only.has(server.fullId));
    }

    console.log(`Building ${servers.length} servers...`);

    let idx = 0;
    for (let serverChunk of getChunkedArray(servers, 25)) {
      for (let server of serverChunk) {
        let version = await getLatestServerVersion(server.fullId);

        if (!version) {
          console.log(`No version found for ${server.fullId}`);
          continue;
        } else {
          try {
            await nixpacksBuild(server.fullId, version.version, {
              platform: opts.platform,
              publish: opts.publish
            });

            await fs.appendFile(
              buildOutputFile,
              [
                `# ${server.fullId} (${version.version})`
                // `## Stdout:`,
                // `\`\`\`bash\n${testRun.stdout}\n\`\`\``,
                // `## Stderr:`,
                // `\`\`\`bash\n${testRun.stderr}\n\`\`\``
              ].join('\n') + '\n\n'
            );
          } catch (e) {
            console.error(`Failed to build ${server.fullId} (${version.version})`);
            console.error(e);
          }
        }

        console.log(`Progress: ${idx++}/${servers.length}`);
      }

      await $`docker system prune -f`;
    }

    process.exit(0);
  });

prog.parse(process.argv);
