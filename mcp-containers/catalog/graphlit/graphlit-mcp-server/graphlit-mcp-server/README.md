
# Graphlit MCP Server

A containerized version of "Graphlit MCP Server"

> Repository: [graphlit/graphlit-mcp-server](https://github.com/graphlit/graphlit-mcp-server)

## Description

Model Context Protocol (MCP) Server for Graphlit Platform


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--graphlit--graphlit-mcp-server--graphlit-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GRAPHLIT_ORGANIZATION_ID=graphlit-organization-id -e GRAPHLIT_ENVIRONMENT_ID=graphlit-environment-id -e GRAPHLIT_JWT_SECRET=graphlit-jwt-secret \
ghcr.io/metorial/mcp-container--graphlit--graphlit-mcp-server--graphlit-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GRAPHLIT_ORGANIZATION_ID`
- `GRAPHLIT_ENVIRONMENT_ID`
- `GRAPHLIT_JWT_SECRET`




## Usage with Claude

```json
{
  "mcpServers": {
    "graphlit-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--graphlit--graphlit-mcp-server--graphlit-mcp-server",
        "npm run start"
      ],
      "env": {
        "GRAPHLIT_ORGANIZATION_ID": "graphlit-organization-id",
        "GRAPHLIT_ENVIRONMENT_ID": "graphlit-environment-id",
        "GRAPHLIT_JWT_SECRET": "graphlit-jwt-secret"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/graphlit/graphlit-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  