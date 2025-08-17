let HEADINGS_OF_INTEREST = ['Official Integrations', 'Community Servers'];

export let findServersFromMCPRepo = async () => {
  let res = await fetch(
    'https://raw.githubusercontent.com/modelcontextprotocol/servers/refs/heads/main/README.md'
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

  return uniqueLinks.map(link => {
    let [repoUrl, rest] = link.split('/tree/');

    if (!rest) return { repoUrl, branch: undefined, subdirectory: '/' };

    let [branch, ...rest2] = rest.split('/').filter(Boolean);
    let subdirectory = rest2.filter(Boolean).join('/');

    return {
      repoUrl,
      branch,
      subdirectory
    };
  });
};
