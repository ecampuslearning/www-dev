import { getDefaultBranch } from '@metorial-mcp-containers/repo';

export let parseRepoUrl = async (url: string) => {
  let repoUrl = new URL(url);
  let parts = repoUrl.pathname.split('/').filter(Boolean);

  let owner = parts[0];
  let repo = parts[1] ?? owner;

  let defaultBranch = await getDefaultBranch(url);

  return {
    provider: repoUrl.hostname.replace('www.', ''),
    owner,
    repo,
    branch: defaultBranch,
    url: repoUrl.toString()
  };
};

export let parseRepoUrlLight = (url: string) => {
  let repoUrl = new URL(url);
  let parts = repoUrl.pathname.split('/').filter(Boolean);

  let owner = parts[0];
  let repo = parts[1] ?? owner;

  return {
    provider: repoUrl.hostname.replace('www.', ''),
    owner,
    repo,
    url: repoUrl.toString()
  };
};
