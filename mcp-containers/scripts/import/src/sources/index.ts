import { blacklist, skipped, unsupported } from '../blacklist';
import { normalizeUrl } from '../lib/normalizeUrl';
import { findServersFromAwesomeRepo } from './awesome';
import { findServersFromMCPRepo } from './mcp';

export let findServers = async () =>
  (await Promise.all([findServersFromAwesomeRepo(), findServersFromMCPRepo()]))
    .flat()
    .map(l => ({
      ...l,
      repoUrl: normalizeUrl(l.repoUrl)
    }))
    .filter(
      l => !blacklist.has(l.repoUrl) && !unsupported.has(l.repoUrl) && !skipped.has(l.repoUrl)
    )
    .sort((a, b) => a.repoUrl.localeCompare(b.repoUrl));
