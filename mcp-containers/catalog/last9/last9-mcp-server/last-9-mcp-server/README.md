
# Last9 MCP Server

A containerized version of "Last9 MCP Server"

> Repository: [last9/last9-mcp-server](https://github.com/last9/last9-mcp-server)

## Description

A [Model Context Protocol](https://modelcontextprotocol.io/) server implementation for [Last9](https://last9.io/mcp/) that enables AI agents to seamlessly bring real-time production context — logs, metrics, and traces — into your local environment to auto-fix code faster.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--last9--last9-mcp-server--last-9-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LAST9_AUTH_TOKEN=last-9-auth-token -e LAST9_BASE_URL=last-9-base-url -e LAST9_REFRESH_TOKEN=last-9-refresh-token \
ghcr.io/metorial/mcp-container--last9--last9-mcp-server--last-9-mcp-server  "node ./bin/cli.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LAST9_AUTH_TOKEN`
- `LAST9_BASE_URL`
- `LAST9_REFRESH_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "last-9-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--last9--last9-mcp-server--last-9-mcp-server",
        "node ./bin/cli.js"
      ],
      "env": {
        "LAST9_AUTH_TOKEN": "last-9-auth-token",
        "LAST9_BASE_URL": "last-9-base-url",
        "LAST9_REFRESH_TOKEN": "last-9-refresh-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/last9/last9-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  