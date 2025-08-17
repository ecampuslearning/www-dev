import { getTempDir } from '@metorial-mcp-containers/temp-dir';
import { $ } from 'bun';

let repos = new Map<string, string>();

export let ensureRepo = async (repoUrl: string, commit?: string) => {
  if (repos.has(repoUrl)) return repos.get(repoUrl)!;

  let dir = await getTempDir('repo');

  try {
    await $`git clone ${repoUrl} ${dir}`.quiet();

    if (commit) {
      try {
        await $`git -C ${dir} checkout ${commit}`.quiet();
      } catch (e) {}
    }
  } catch (e) {
    console.error(e);
    throw new Error(`Failed to clone repo: ${repoUrl}`);
  }

  repos.set(repoUrl, dir);

  return dir;
};
