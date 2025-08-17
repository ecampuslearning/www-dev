import { Cases } from '@metorial-mcp-containers/case';
import fs from 'fs-extra';
import path from 'path';
import type { ConfigValue } from '../config';
import { parseRepoUrl, parseRepoUrlLight } from '../repoUrl';
import { rootDir } from '../root';
import type { ServerManifest } from '../types/schema';

export let getServerIdShort = (d: { repoUrl: string; subdirectory?: string }) => {
  let repo = parseRepoUrlLight(d.repoUrl);

  return Cases.toKebabCase(
    (d.subdirectory ?? '').split('/').filter(Boolean).pop() ?? repo.repo
  );
};

export let getServerIdFull = (d: { repoUrl: string; subdirectory?: string }) => {
  let repo = parseRepoUrlLight(d.repoUrl);
  let short = getServerIdShort(d);

  return `${repo.owner}/${repo.repo}/${short}`;
};

export let buildManifest = async (d: {
  repoUrl: string;
  config: { argumentsTemplate: string | null; configValues: ConfigValue[] };
  subdirectory: string;
  title: string;
  description: string | null;
}) => {
  let repo = await parseRepoUrl(d.repoUrl);

  return {
    id: getServerIdShort(d),
    fullId: await getServerIdFull(d),
    repo,
    config: d.config,
    subdirectory: d.subdirectory,
    title: d.title,
    description: d.description
  } satisfies ServerManifest;
};

export let writeManifest = async (manifest: ServerManifest) => {
  let relativeManifestDir = `catalog/${manifest.repo.owner}/${manifest.repo.repo}/${manifest.id}`;

  let manifestDir = path.join(rootDir, relativeManifestDir);
  await fs.ensureDir(manifestDir);
  await fs.ensureDir(path.join(manifestDir, 'scripts'));

  await fs.writeFile(
    path.join(manifestDir, 'manifest.json'),
    JSON.stringify(manifest, null, 2)
  );

  return { relativeManifestDir };
};
