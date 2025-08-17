import klaw from 'klaw';
import { ensureRepo } from './ensureRepo';

export let getDirsInRepo = async (repoUrl: string) => {
  let dir = await ensureRepo(repoUrl);

  let dirs = new Set<string>();

  for await (let item of klaw(dir)) {
    if (item.stats.isDirectory()) dirs.add(item.path);
  }

  return Array.from(dirs)
    .map(d => d.replace(dir, '').trim())
    .filter(Boolean);
};
