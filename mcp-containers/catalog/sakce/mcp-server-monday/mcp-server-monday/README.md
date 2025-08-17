
# Monday.com MCP server

A containerized version of "Monday.com MCP server"

> Repository: [sakce/mcp-server-monday](https://github.com/sakce/mcp-server-monday)

## Description

MCP Server for monday.com, enabling MCP clients to interact with Monday.com boards, items, updates, and documents.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--sakce--mcp-server-monday--mcp-server-monday
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MONDAY_API_KEY=monday-api-key -e MONDAY_WORKSPACE_NAME=monday-workspace-name \
ghcr.io/metorial/mcp-container--sakce--mcp-server-monday--mcp-server-monday  "mcp-server-monday"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MONDAY_API_KEY`
- `MONDAY_WORKSPACE_NAME`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-monday": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--sakce--mcp-server-monday--mcp-server-monday",
        "mcp-server-monday"
      ],
      "env": {
        "MONDAY_API_KEY": "monday-api-key",
        "MONDAY_WORKSPACE_NAME": "monday-workspace-name"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/sakce/mcp-server-monday) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  