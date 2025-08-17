import type { ServerManifest, ServerVersion } from '@metorial-mcp-containers/manifest';
import { stripMarkdown } from './stripMarkdown';

export let generateServerReadme = async (server: ServerManifest, version: ServerVersion) => {
  let containerName = `ghcr.io/metorial/mcp-container--${server.fullId
    .replaceAll('/', '--')
    .toLowerCase()}`;

  let args = server.config.configValues.flatMap(c =>
    c.fields.filter(f => f.type == 'cli').map(f => ({ ...f, config: c }))
  );
  let env = server.config.configValues.flatMap(c =>
    c.fields.filter(f => f.type == 'environment').map(f => ({ ...f, config: c }))
  );

  let additionalArgs = [
    version.builder[0]?.plan?.start?.cmd,
    server.config.argumentsTemplate,
    ...args.filter(a => a.key.startsWith('--')).map(arg => `${arg.key} ${arg.config.title}`)
  ]
    .filter(Boolean)
    .join(' ');

  return `
# ${server.title}

A containerized version of "${server.title}"

> Repository: [${server.repo.owner}/${server.repo.repo}](${server.repo.url})

## Description

${await stripMarkdown(server.description ?? '', 'simple-formatting')}

## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

\`\`\`bash
docker pull ${containerName}
\`\`\`

2. Run the container:

\`\`\`bash
docker run -i --rm \\ ${
    env.length ? `\n${env.map(e => `-e ${e.key}=${e.config.title}`).join(' ')} \\` : ''
  }
${containerName} ${server.config.argumentsTemplate ?? ''} ${
    additionalArgs ? JSON.stringify(additionalArgs) : ''
  }
\`\`\`

- \`--rm\` removes the container after it exits, so you don't have to clean up manually.
- \`-i\` allows you to interact with the container in your terminal.


${
  args.length || env.length
    ? `
### Configuration

The container supports the following configuration options:

${
  args.length
    ? `
#### Arguments

${args.map(arg => `- \`${arg.key}\``).join('\n')}
`
    : ''
}

${
  env.length
    ? `
#### Environment Variables

${env.map(env => `- \`${env.key}\``).join('\n')}
`
    : ''
}

`
    : ''
}

## Usage with Claude

\`\`\`json
${JSON.stringify(
  {
    mcpServers: {
      [server.id]: {
        command: 'docker',
        args: ['run', '-i', '--rm', containerName, additionalArgs].filter(Boolean),
        env: {
          ...Object.fromEntries(env.map(e => [e.key, e.config.title]))
        }
      }
    }
  },
  null,
  2
)}
\`\`\`

# License

Please refer to the license provided in [the project repository](${
    server.repo.url
  }) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  `;
};
