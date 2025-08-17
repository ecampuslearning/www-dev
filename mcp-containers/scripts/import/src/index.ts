import {
  buildConfig,
  buildManifest,
  getServerIdFull,
  manifestExists,
  writeManifest
} from '@metorial-mcp-containers/manifest';
import { getServerConfigRaw } from '@metorial-mcp-containers/server-config';
import fs from 'fs-extra';
import path from 'path';
import sade from 'sade';
import { findServers } from './sources';

let prog = sade('importer');

prog
  .command('import', undefined, { default: true })
  .option('--limit, -l', 'Limit the number of servers to import')
  .action(async (opts: { limit?: string }) => {
    let servers = await findServers();

    let limit = opts.limit ? parseInt(opts.limit) : Infinity;

    let importOutputFile = path.join(process.cwd(), 'import.md');
    await fs.ensureFile(importOutputFile);
    await fs.appendFile(importOutputFile, '-----START-----\n');

    let serverIdx = 0;
    for (let server of servers) {
      let id = getServerIdFull({
        repoUrl: server.repoUrl,
        subdirectory: server.subdirectory
      });

      if (await manifestExists(id)) {
        console.log(`Server ${id} already exists, skipping...`);
        continue;
      }

      console.log(`Importing server ${id}...`);

      let parsedRepo = await getServerConfigRaw(server.repoUrl, server.subdirectory);

      let config = buildConfig({
        cliArguments: parsedRepo.cliArguments,
        environmentVariables: parsedRepo.environmentVariables,
        files: []
      });

      let manifest = await buildManifest({
        repoUrl: server.repoUrl,
        subdirectory: server.subdirectory,
        title: parsedRepo.title ?? id.split('/').pop() ?? 'Unknown',
        description: parsedRepo.description,
        config
      });

      let { relativeManifestDir } = await writeManifest(manifest);

      await fs.appendFile(
        importOutputFile,
        [
          `# ${manifest.title}\n`,
          `- ****: ${manifest.description}`,
          `- **Description**: ${manifest.description}`,
          `- **Repo**: ${manifest.repo.url}`,
          `- **Directory**: ${relativeManifestDir}`,
          `\n### Config\n`,
          `\`\`\`json\n${JSON.stringify(manifest.config, null, 2)}\n\`\`\``
        ].join('\n') + '\n\n\n'
      );

      serverIdx++;
      if (serverIdx >= limit) break;
    }
  });

prog.parse(process.argv);
