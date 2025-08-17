import type { NixpacksPlan } from '@metorial-mcp-containers/nixpacks';
import fs from 'fs-extra';
import path from 'path';
import { getServerDefinitionDir } from '../manifest/read';
import type { ServerManifest } from '../types/schema';

export interface ServerVersion {
  serverId: string;
  version: string;
  manifest: ServerManifest;
  manifestHash: string;
  createdAt: string;
  builder: { type: 'nixpacks'; plan: NixpacksPlan }[];
}

export let getServerVersions = async (serverId: string) => {
  let definitionDir = getServerDefinitionDir(serverId);
  let versionsDir = path.join(definitionDir, 'versions');
  if (!(await fs.exists(versionsDir))) {
    return [];
  }

  let versions = await fs.readdir(versionsDir);

  return (await Promise.all(
    versions.map(async version => fs.readJSON(path.join(versionsDir, version, 'version.json')))
  )) as ServerVersion[];
};

export let getLatestServerVersion = async (serverId: string) => {
  let versions = await getServerVersions(serverId);

  return versions.sort((a, b) => {
    return new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime();
  })[0];
};
