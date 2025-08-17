import fs from 'fs-extra';
import path from 'path';
import { rootDir } from '../root';
import type { ServerManifest } from '../types/schema';

let isDir = (path: string) =>
  fs
    .stat(path)
    .then(stat => stat.isDirectory())
    .catch(() => false);

export let getAllServers = async () => {
  let catalogDir = path.join(rootDir, 'catalog');
  let serverManifests: ServerManifest[] = [];

  let orgs = await fs.readdir(catalogDir);
  for (let org of orgs) {
    let orgPath = path.join(catalogDir, org);
    if (!(await isDir(orgPath))) continue;

    let repos = await fs.readdir(orgPath);

    for (let repo of repos) {
      let repoPath = path.join(orgPath, repo);
      if (!(await isDir(repoPath))) continue;

      let servers = await fs.readdir(repoPath);

      for (let server of servers) {
        let serverPath = path.join(repoPath, server);
        if (!(await isDir(serverPath))) continue;

        let manifestPath = path.join(serverPath, 'manifest.json');
        if (!(await fs.exists(manifestPath))) continue;

        let serverManifest = await fs.readJson(manifestPath);
        serverManifests.push(serverManifest);
      }
    }
  }

  return serverManifests.sort((a, b) => a.fullId.localeCompare(b.fullId));
};
