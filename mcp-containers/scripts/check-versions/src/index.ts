import { checkVersions, getAllServers } from '@metorial-mcp-containers/manifest';
import sade from 'sade';

sade('check-versions', true)
  .option('--force, -f', 'Force version manifest creation even if it exists')
  .action(async (opts: { force: boolean }) => {
    let servers = await getAllServers();
    console.log(`Found ${servers.length} servers`);

    await checkVersions(opts);

    console.log('Done!');
  })
  .parse(process.argv);
