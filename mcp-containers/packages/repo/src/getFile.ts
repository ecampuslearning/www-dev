import fs from 'fs-extra';
import path from 'path';
import { ensureRepo } from './ensureRepo';

export let getFile = async (fileNames: string[], repoUrl: string, subdirectory: string) => {
  let dir = await ensureRepo(repoUrl);

  let subdirs = subdirectory.split('/').filter(Boolean);
  subdirs.unshift('');

  while (subdirs.length) {
    let subdir = subdirs.join('/');

    for (let file of fileNames) {
      let filePath = path.join(dir, subdir, file);

      if (await fs.pathExists(filePath)) {
        return await fs.readFile(filePath, 'utf-8');
      }
    }

    subdirs.pop();
  }

  return null;
};
