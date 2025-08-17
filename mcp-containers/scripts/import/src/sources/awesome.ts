import { blacklist, unsupported } from '../blacklist';

let HEADINGS_OF_INTEREST = [
  'art-and-culture',
  'browser-automation',
  'cloud-platforms',
  'code-execution',
  'coding-agents',
  'command-line',
  'communication',
  'customer-data-platforms',
  'databases',
  'data-platforms',
  'developer-tools',
  'data-science-tools',
  'embedded-system',
  'file-systems',
  'finance--fintech',
  'gaming',
  'knowledge--memory',
  'location-services',
  'marketing',
  'monitoring',
  'search',
  'security',
  'sports',
  'support-and-service-management',
  'translation-services',
  'travel-and-transportation',
  'version-control',
  'other-tools-and-integrations'
];

export let findServersFromAwesomeRepo = async () => {
  let res = await fetch(
    'https://raw.githubusercontent.com/punkpeye/awesome-mcp-servers/refs/heads/main/README.md'
  );
  let text = await res.text();

  let lines = text.split('\n');
  let chunks: string[][] = [];

  while (lines.length) {
    let line = lines.shift()!;
    if (line.startsWith('#') && HEADINGS_OF_INTEREST.some(h => line.includes(h))) {
      do {
        chunks.push([line]);
        line = lines.shift()!;
      } while (!lines[0].startsWith('#') && lines.length);
    }
  }

  let links = chunks.flatMap(chunk =>
    chunk
      .filter(l => l.startsWith('- ['))
      .map(l => {
        let parensStart = l.indexOf('(');
        let parensEnd = l.indexOf(')');

        return l.substring(parensStart + 1, parensEnd);
      })
      .filter(l => l.startsWith('https://github.com/'))
      .map(l => {
        let [url] = l.split('/blob/');
        return url;
      })
  );

  let uniqueLinks = [...new Set(links)];

  return uniqueLinks
    .map(link => {
      let [repoUrl, rest] = link.split('/tree/');

      if (!rest) return { repoUrl, branch: undefined, subdirectory: '/' };

      let [branch, ...rest2] = rest.split('/').filter(Boolean);
      let subdirectory = rest2.filter(Boolean).join('/');

      return {
        repoUrl,
        branch,
        subdirectory
      };
    })
    .filter(l => !blacklist.has(l.repoUrl) && !unsupported.has(l.repoUrl));
};
