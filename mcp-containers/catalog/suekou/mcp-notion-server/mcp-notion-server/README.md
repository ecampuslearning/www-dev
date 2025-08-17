
# Notion MCP Server

A containerized version of "Notion MCP Server"

> Repository: [suekou/mcp-notion-server](https://github.com/suekou/mcp-notion-server)

## Description

MCP Server for the Notion API, enabling LLM to interact with Notion workspaces. Additionally, it employs Markdown conversion to reduce context size when communicating with LLMs, optimizing token usage and making interactions more efficient.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--suekou--mcp-notion-server--mcp-notion-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NOTION_API_TOKEN=notion-api-token \
ghcr.io/metorial/mcp-container--suekou--mcp-notion-server--mcp-notion-server  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NOTION_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-notion-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--suekou--mcp-notion-server--mcp-notion-server",
        "node build/index.js"
      ],
      "env": {
        "NOTION_API_TOKEN": "notion-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/suekou/mcp-notion-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  