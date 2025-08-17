import { parse } from 'partial-json';

export let parseMCPServers = (config: string) => {
  try {
    let data = tryParseJson(config);
    // let server = Object.values(data)[0];

    let server: {
      command: string;
      args?: string[];
      env?: Record<string, string>;
    } = data;

    while (typeof server == 'object' && typeof server.command != 'string') {
      server = Object.values(server)[0] as any;
    }

    if (typeof server != 'object')
      throw new Error(`Invalid server config: ${JSON.stringify(config, null, 2)}`);

    let argParser = argParsers.find(p => p.commands.some(cmd => cmd(server.command)));
    if (!argParser) throw new Error(`Unknown command: ${server.command}`);

    let args = argParser.parser(server.args || []) ?? [];

    return {
      cliArguments: {
        template: args.join(' '),
        keys: args.filter(a => a.toUpperCase() === a).map(key => ({ key }))
      },
      environmentVariables: Object.entries(server.env || {}).map(([key, value]) => ({
        key
      }))
    };
  } catch (e) {
    console.error(e);
    return null;
  }
};

let pathCommand = (a: string) => (b: string) => a === b || b.endsWith(`/${a}`);

let argParsers = [
  {
    commands: [
      pathCommand('uvx'),
      pathCommand('npx'),
      pathCommand('python'),
      pathCommand('python3'),
      pathCommand('node'),
      pathCommand('ts-node'),
      pathCommand('bun'),
      pathCommand('bunx')
    ],
    parser: (args: string[]) => {
      for (let i = 0; i < args.length; i++) {
        let arg = args[i];
        if (arg.startsWith('-')) continue;

        return args.slice(i + 1);
      }
    }
  },

  {
    commands: [pathCommand('uv')],
    parser: (args: string[]) => {
      for (let i = 0; i < args.length; i++) {
        let arg = args[i];
        if (arg == '-m' || arg == '--module') {
          return args.slice(i + 2);
        }
      }

      for (let i = 0; i < args.length; i++) {
        let arg = args[i];
        if (arg == 'run') {
          return args.slice(i + 1);
        }
      }
    }
  }
];

let tryParseJson = (str: string) => {
  try {
    return JSON.parse(str);
  } catch (e) {}

  try {
    return JSON.parse(`{${str}}`);
  } catch (e) {}

  try {
    return JSON.parse(`{${str}`);
  } catch (e) {}

  try {
    return JSON.parse(`${str}}`);
  } catch (e) {}

  let lines = str.split('\n');
  for (let i = lines.length - 1; i >= 0; i--) {
    let current = lines.slice(0, i + 1).join('\n');
    try {
      return JSON.parse(current);
    } catch (e) {}
  }

  for (let i = 0; i < lines.length; i++) {
    let current = lines.slice(i).join('\n');
    try {
      return JSON.parse(current);
    } catch (e) {}
  }

  try {
    return parse(str);
  } catch (e) {}

  throw new Error(`Failed to parse JSON: ${str}`);
};
