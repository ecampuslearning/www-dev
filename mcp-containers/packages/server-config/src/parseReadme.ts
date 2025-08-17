import { unique } from '@metorial-mcp-containers/unique';
import { parseMCPServers } from './parseMCPServers';

let DEFINITELY_NOT_ENV_VARS = [
  'README',
  'LICENSE',
  'LICENSES',
  'APPDATA',
  'GET',
  'POST',
  'PUT',
  'DELETE',
  'PATCH',
  'OPTIONS',
  'HEAD',
  'PATH',
  'TEMP',
  'TMP',
  'RESPONSE',
  'REQUEST',
  'INSTALL',
  'CHANGELOG',
  'FEATURES',
  'CONTRIBUTING',
  'CONTRIBUTORS',
  'VERSION'
];
let DEFINITELY_NOT_ARGS = [
  '--directory',
  '--help',
  '--version',
  '--verbose',
  '--quiet',
  '--debug',
  '--init',
  '--config',
  '--config-file',
  '--config-path',
  '--config-dir',
  '--rm',
  '--platform',
  '--client'
];

export let parseReadme = (readme: string) => {
  let title = null;
  let titleMatch = readme.match(/<h1[^>]*>(.*?)<\/h1>/i);
  if (titleMatch && titleMatch[1]) {
    title = titleMatch[1].trim();
  }

  if (!title) {
    titleMatch = readme.match(/^#\s*(.+)$/m);
    if (titleMatch && titleMatch[1]) {
      title = titleMatch[1].trim();
    }
  }

  let description = null;
  if (titleMatch) {
    let titleIndex = readme.indexOf(titleMatch[0]);
    let afterTitleLines = readme
      .slice(titleIndex + titleMatch[0].length)
      .trim()
      .split('\n');

    let afterTitle = afterTitleLines
      .map(l => l.trim())
      .filter(Boolean)
      .filter(l => !l.startsWith('(') && !l.startsWith('!') && !l.startsWith('['));

    description = afterTitle[0] || null;
  }

  let mcpBlocks = findMCPServerCodeBlocks(readme);

  for (let mcpBlock of mcpBlocks) {
    let parsed = parseMCPServers(mcpBlock);
    if (!parsed) continue;

    return {
      title,
      description,
      cliArguments: parsed.cliArguments,
      environmentVariables: parsed.environmentVariables
    };
  }

  let cliArgRegex = /(--[a-zA-Z0-9][a-zA-Z0-9-_]+)/g;
  let cliArguments = readme.match(cliArgRegex) || [];

  let envVarRegex = /\b[A-Z][A-Z0-9_]{5,}\b/g;
  let environmentVariables = readme.match(envVarRegex) || [];

  return {
    title,
    description,
    cliArguments: {
      arguments: unique(cliArguments.filter(arg => !DEFINITELY_NOT_ARGS.includes(arg)))
        .map(arg => arg.trim())
        .map(key => ({ key }))
    },
    environmentVariables: unique(
      environmentVariables.filter(envVar => !DEFINITELY_NOT_ENV_VARS.includes(envVar))
    )
      .map(e => e.trim())
      .map(key => ({ key }))
  };
};

let findMCPServerCodeBlock = (readme: string, after = 0) => {
  let readmeSlice = readme.slice(after);

  let mcpServerObject = readmeSlice.indexOf('"mcpServers":');
  let mcpServerCodeBlockEnd = readmeSlice.indexOf('```', mcpServerObject);
  let mcpServerCodeBlockStart = readmeSlice.indexOf('{', mcpServerObject);

  let mcpServerCodeBlock = null;
  if (mcpServerCodeBlockStart > -1 && mcpServerCodeBlockEnd > -1) {
    mcpServerCodeBlock = readmeSlice
      .slice(mcpServerCodeBlockStart, mcpServerCodeBlockEnd)
      .trim();
  }

  if (!mcpServerCodeBlock) return null;

  return {
    code: mcpServerCodeBlock,
    position: {
      start: mcpServerCodeBlockStart + after,
      end: mcpServerCodeBlockEnd + after
    }
  };
};

let findMCPServerCodeBlocks = (readme: string) => {
  let blocks: string[] = [];
  let after = 0;

  while (true) {
    let block = findMCPServerCodeBlock(readme, after);
    if (!block) break;

    blocks.push(block.code);
    after = block.position.end;
  }

  return blocks;
};
