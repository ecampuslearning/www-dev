
# Notion MCP Server

A containerized version of "Notion MCP Server"

> Repository: [makenotion/notion-mcp-server](https://github.com/makenotion/notion-mcp-server)

## Description

This project implements an [MCP server](https://spec.modelcontextprotocol.io/) for the [Notion API](https://developers.notion.com/reference/intro).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--makenotion--notion-mcp-server--notion-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OPENAPI_MCP_HEADERS=openapi-mcp-headers \
ghcr.io/metorial/mcp-container--makenotion--notion-mcp-server--notion-mcp-server  "node bin/cli.mjs"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OPENAPI_MCP_HEADERS`




## Usage with Claude

```json
{
  "mcpServers": {
    "notion-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--makenotion--notion-mcp-server--notion-mcp-server",
        "node bin/cli.mjs"
      ],
      "env": {
        "OPENAPI_MCP_HEADERS": "openapi-mcp-headers"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/makenotion/notion-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  