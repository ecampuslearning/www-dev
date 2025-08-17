import { confirm, input, search } from '@inquirer/prompts';
import { delay } from '@metorial-mcp-containers/delay';
import {
  buildConfig,
  buildManifest,
  checkVersions,
  getLatestServerVersion,
  writeManifest
} from '@metorial-mcp-containers/manifest';
import { nixpacksBuild } from '@metorial-mcp-containers/nixpacks';
import { getDirsInRepo } from '@metorial-mcp-containers/repo';
import { getServerConfigRaw } from '@metorial-mcp-containers/server-config';
import sade from 'sade';

export let initializeCli = async () => {
  sade('add-server [repoUrl] [subdirectory]', true)
    .option('--yes, -y', 'Skip confirmation')
    .action(async (repoUrlOpt, subdirectoryOpt, { yes }: { yes: boolean }) => {
      let repoUrl = repoUrlOpt ?? (await input({ message: 'Enter Repo URL' }));

      let dirsInRepo = await getDirsInRepo(repoUrl);
      let allDirs = ['/', ...dirsInRepo];

      let subdirectory =
        subdirectoryOpt ??
        (await search({
          message: 'Select a subdirectory',
          source: term => {
            if (!term) return allDirs;
            return allDirs
              .filter(dir => dir.toLowerCase().includes(term.toLowerCase()))
              .map(dir => ({
                value: dir,
                name: dir
              }));
          }
        }));

      let parsedRepo = await getServerConfigRaw(repoUrl, subdirectory);

      let title = yes
        ? parsedRepo?.title ?? repoUrl.split('/').reverse()[0]
        : await input({
            message: 'Title',
            default: parsedRepo?.title ?? ''
          });

      let description = yes
        ? parsedRepo?.description ?? null
        : await input({
            message: 'Description',
            default: parsedRepo?.description ?? ''
          });

      let cliArguments = parsedRepo?.cliArguments;
      let environmentVariables = parsedRepo?.environmentVariables ?? [];
      let files: string[] = [];

      if (!yes) {
        let cliArgsInner = !cliArguments
          ? []
          : 'arguments' in cliArguments
          ? cliArguments.arguments
          : cliArguments.keys;

        let changeCliArgs = !cliArgsInner.length;

        if (!changeCliArgs) {
          console.log('✔ Detected CLI arguments:');
          for (let arg of cliArgsInner) {
            console.log(`    > ${arg.key}`);
          }

          changeCliArgs = await confirm({
            message: 'Do you want to change the detected CLI arguments?',
            default: false
          });
        }

        if (changeCliArgs) {
          while (true) {
            let cliArg = await input({
              message: 'Enter CLI argument, e.g., --arg (or leave empty to finish)'
            });

            if (!cliArg) break;

            cliArgsInner.push({ key: cliArg });
          }

          cliArguments = {
            arguments: cliArgsInner
          };
        }

        let changeEnvVars = !environmentVariables.length;

        if (!changeEnvVars) {
          console.log('✔ Detected environment variables:');
          for (let envVar of environmentVariables) {
            console.log(`    > ${envVar.key}`);
          }

          changeEnvVars = await confirm({
            message: 'Do you want to change the detected environment variables?',
            default: false
          });
        }

        if (changeEnvVars) {
          environmentVariables = [];

          while (true) {
            let envVar = await input({
              message:
                'Enter environment variable, e.g., MY_ENV_VAR (or leave empty to finish)'
            });

            if (!envVar) break;

            environmentVariables.push({ key: envVar });
          }
        }

        while (true) {
          let file = await input({
            message: 'Enter config file path, e.g., config.json (or leave empty to finish)'
          });
          if (!file) break;

          file = file.split('/').filter(Boolean).join('/');
          files.push(file);
        }
      }

      let config = buildConfig({
        cliArguments,
        environmentVariables,
        files
      });

      let manifest = await buildManifest({
        repoUrl,
        config,
        subdirectory,
        title,
        description
      });

      let { relativeManifestDir } = await writeManifest(manifest);

      console.log('✔ MCP server manifest created at', `./${relativeManifestDir}`);
      console.log('You can place custom pre build scripts in the `scripts` folder.');
      // console.log(
      //   `Once you're done editing the MCP server manifest, create a pull request to https://github.com/metorial/mcp-containers`
      // );

      console.log(
        `Once you're done editing the MCP server manifest, please confirm to continue.`
      );

      if (!(await confirm({ message: 'Did you check the manifest?', default: true }))) {
        console.log('Aborting...');
        process.exit(0);
      }

      console.log('Continuing...');
      console.log('Discovering latest version...');

      await delay(1000);

      let serverId = manifest.fullId;

      await checkVersions({
        force: true,
        only: [serverId]
      });

      await delay(1000);

      console.log('Starting server test build...');

      let latestVersion = await getLatestServerVersion(serverId);
      await nixpacksBuild(serverId, latestVersion.version, {});

      console.log('✔ Server test build completed successfully!');
      console.log(
        'You can now create a pull request to https://github.com/metorial/mcp-containers to add the server.'
      );
    })
    .parse(process.argv);
};
