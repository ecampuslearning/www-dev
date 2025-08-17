import { $ } from 'bun';

export let getDefaultBranch = async (repoUrl: string) => {
  let out = await $`git ls-remote --symref ${repoUrl} HEAD`.quiet().text('utf-8');
  let lines = out.split('\n');

  let branchLine = lines.find(line => line.startsWith('ref: refs/heads/'));
  if (!branchLine) {
    throw new Error('No default branch found');
  }

  let branchName = branchLine
    .replace('ref: refs/heads/', '')
    .replaceAll('\t', ' ')
    .split(' ')[0];
  if (!branchName) {
    throw new Error('No default branch found');
  }

  return branchName.replace('refs/heads/', '');
};
