import type { ServerManifest } from '@metorial-mcp-containers/manifest';
import { TOML } from 'bun';
import fs from 'fs-extra';
import path from 'path';

export let getNixpacksOptions = async (buildDir: string, manifest: ServerManifest) => {
  let cmd: string[] = [];

  if (manifest.build?.startCommand) {
    cmd.push('--start-cmd', manifest.build.startCommand);
  } else {
    let packageJsonPath = path.join(buildDir, 'package.json');
    if (await fs.exists(packageJsonPath)) {
      let packageJson = await fs.readJSON(packageJsonPath);

      if (!packageJson.scripts?.start) {
        if (packageJson.bin || packageJson.bins) {
          let bin = packageJson.bin || packageJson.bins;
          if (typeof bin == 'object') bin = Object.values(bin)[0];

          cmd.push('--start-cmd', `node ${bin}`);
        } else if (packageJson.main) {
          cmd.push('--start-cmd', `node ${packageJson.main}`);
        }
      }
    }

    let pyProjectPath = path.join(buildDir, 'pyproject.toml');
    if (await fs.exists(pyProjectPath)) {
      let pyProjectRaw = await fs.readFile(pyProjectPath, 'utf-8');
      let pyProject = TOML.parse(pyProjectRaw) as {
        project: { scripts: Record<string, string> };
      };

      if (pyProject?.project?.scripts) {
        let anyScript = Object.keys(pyProject.project.scripts)[0];
        if (anyScript) cmd.push('--start-cmd', anyScript);
      }
    }
  }

  if (manifest.build?.buildCommand) {
    cmd.push('--build-cmd', manifest.build.buildCommand);
  }

  if (manifest.build?.installCommand) {
    cmd.push('--install-cmd', manifest.build.installCommand);
  }

  if (manifest.build?.nixPackages) {
    for (let pkg of manifest.build.nixPackages) {
      cmd.push('--pkgs', pkg);
    }
  }

  if (manifest.build?.aptPackages) {
    for (let pkg of manifest.build.aptPackages) {
      cmd.push('--apt', pkg);
    }
  }

  return cmd;
};

export let getNixpacksEnv = (manifest: ServerManifest) => ({
  ...process.env,
  NIXPACKS_NODE_VERSION: manifest.build?.nodeVersion ?? '20',
  NIXPACKS_PYTHON_VERSION: manifest.build?.pythonVersion ?? '3.11'
});
