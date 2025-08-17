import { readManifest } from '@metorial-mcp-containers/manifest';
import { ensureNixDir } from './nixDir';
import { getNixpacksEnv, getNixpacksOptions } from './options';

export interface NixpacksPlan {
  providers: string[];
  buildImage: string;
  variables: Record<string, string>;
  phases: Record<
    string,
    {
      dependsOn: string[];
      cmds: string[];
      cacheDirectories: string[];
      paths: string[];
      nixPkgs: string[];
      nixOverlays: string[];
      nixpkgsArchive: string;
    }
  >;
  start: {
    cmd: string;
  };
}

export let nixpacksPlan = async (id: string, version: string) => {
  let manifest = await readManifest(id);
  let dir = await ensureNixDir(id, version);

  let cmd: string[] = ['nixpacks', 'plan', '.', ...(await getNixpacksOptions(dir, manifest))];

  let proc = Bun.spawn({
    cmd,
    cwd: dir,
    stdout: 'pipe',
    stderr: 'inherit',
    env: getNixpacksEnv(manifest)
  });

  let output = await new Response(proc.stdout).text();

  return JSON.parse(output) as NixpacksPlan;
};
