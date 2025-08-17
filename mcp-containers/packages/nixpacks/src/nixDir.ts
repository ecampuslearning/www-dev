import { getServerDefinitionDir, readManifest } from '@metorial-mcp-containers/manifest';
import { ensureRepo } from '@metorial-mcp-containers/repo';
import { $ } from 'bun';
import fs from 'fs-extra';
import path from 'path';

export let ensureNixDir = async (id: string, version: string) => {
  let manifest = await readManifest(id);
  let repoDir = await ensureRepo(manifest.repo.url, version);

  let definitionDir = getServerDefinitionDir(id);
  let scriptsDir = path.join(definitionDir, 'scripts');
  let scripts: string[] = [];

  if (await fs.exists(scriptsDir)) {
    scripts = await fs.readdir(scriptsDir);
  }

  let buildDir = path.join(
    repoDir,
    manifest.subdirectory.split('/').filter(Boolean).join('/')
  );

  if (scripts.length) {
    console.log(`Running scripts for ${id} (${version})`);

    for (let script of scripts) {
      if (script.endsWith('.sh')) {
        await $`bash ${path.join(scriptsDir, script)}`.cwd(buildDir);
      } else if (
        script.endsWith('.js') ||
        script.endsWith('.cjs') ||
        script.endsWith('.mjs')
      ) {
        await $`node ${path.join(scriptsDir, script)}`.cwd(buildDir);
      } else if (script.endsWith('.ts')) {
        await $`bun ${path.join(scriptsDir, script)}`.cwd(buildDir);
      } else if (script.endsWith('.py')) {
        await $`python ${path.join(scriptsDir, script)}`.cwd(buildDir);
      } else {
        throw new Error(`Unknown script type: ${script}`);
      }
    }

    console.log(`Finished running scripts for ${id} (${version})`);
  }

  return buildDir;
};
