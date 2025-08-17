
# JetBrains MCP Proxy Server

A containerized version of "JetBrains MCP Proxy Server"

> Repository: [JetBrains/mcpProxy](https://github.com/JetBrains/mcpProxy)

## Description

The server proxies requests from client to JetBrains IDE.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jetbrains--mcpproxy--mcp-proxy
```

2. Run the container:

```bash
docker run -i --rm \ 
-e IDE_PORT=IDE_PORT -e HOST=HOST \
ghcr.io/metorial/mcp-container--jetbrains--mcpproxy--mcp-proxy  "node dist/src/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `IDE_PORT`
- `HOST`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-proxy": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jetbrains--mcpproxy--mcp-proxy",
        "node dist/src/index.js"
      ],
      "env": {
        "IDE_PORT": "IDE_PORT",
        "HOST": "HOST"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/JetBrains/mcpProxy) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  