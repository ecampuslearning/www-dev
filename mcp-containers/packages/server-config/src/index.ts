import { getFile } from '@metorial-mcp-containers/repo';
import { README_NAMES } from './config';
import { parseReadme } from './parseReadme';

export let getServerConfigRaw = async (repoUrl: string, subdirectory: string) => {
  let readme = await getFile(README_NAMES, repoUrl, subdirectory);
  let parsedReadme = readme ? parseReadme(readme) : null;

  // let smitheryConfig = await getFile(SMITHERY_NAMES, repoUrl, subdirectory);
  // let parsedSmitheryConfig = smitheryConfig ? parseSmithery(smitheryConfig) : null;

  return {
    title: parsedReadme?.title ?? null,
    description: parsedReadme?.description ?? null,
    cliArguments: parsedReadme?.cliArguments ?? null,
    environmentVariables: parsedReadme?.environmentVariables ?? null
  };
};
