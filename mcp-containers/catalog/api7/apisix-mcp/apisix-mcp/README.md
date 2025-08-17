
# APISIX Model Context Protocol (MCP) Server

A containerized version of "APISIX Model Context Protocol (MCP) Server"

> Repository: [api7/apisix-mcp](https://github.com/api7/apisix-mcp)

## Description

APISIX Model Context Protocol (MCP) server is used to bridge large language models (LLMs) with the APISIX Admin API. It aims to enable natural language-based interaction for viewing and managing resources in APISIX through MCP-compatible AI clients.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--api7--apisix-mcp--apisix-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e APISIX_SERVER_HOST=apisix-server-host -e APISIX_SERVER_PORT=apisix-server-port -e APISIX_ADMIN_API_PORT=apisix-admin-api-port -e APISIX_ADMIN_API_PREFIX=apisix-admin-api-prefix -e APISIX_ADMIN_KEY=apisix-admin-key \
ghcr.io/metorial/mcp-container--api7--apisix-mcp--apisix-mcp  "pnpm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `APISIX_SERVER_HOST`
- `APISIX_SERVER_PORT`
- `APISIX_ADMIN_API_PORT`
- `APISIX_ADMIN_API_PREFIX`
- `APISIX_ADMIN_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "apisix-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--api7--apisix-mcp--apisix-mcp",
        "pnpm run start"
      ],
      "env": {
        "APISIX_SERVER_HOST": "apisix-server-host",
        "APISIX_SERVER_PORT": "apisix-server-port",
        "APISIX_ADMIN_API_PORT": "apisix-admin-api-port",
        "APISIX_ADMIN_API_PREFIX": "apisix-admin-api-prefix",
        "APISIX_ADMIN_KEY": "apisix-admin-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/api7/apisix-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  