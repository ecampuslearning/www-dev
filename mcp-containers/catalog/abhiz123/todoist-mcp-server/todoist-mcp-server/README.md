
# Todoist MCP Server

A containerized version of "Todoist MCP Server"

> Repository: [abhiz123/todoist-mcp-server](https://github.com/abhiz123/todoist-mcp-server)

## Description

An MCP (Model Context Protocol) server implementation that integrates Claude with Todoist, enabling natural language task management. This server allows Claude to interact with your Todoist tasks using everyday language.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--abhiz123--todoist-mcp-server--todoist-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TODOIST_API_TOKEN=todoist-api-token \
ghcr.io/metorial/mcp-container--abhiz123--todoist-mcp-server--todoist-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TODOIST_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "todoist-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--abhiz123--todoist-mcp-server--todoist-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "TODOIST_API_TOKEN": "todoist-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/abhiz123/todoist-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  