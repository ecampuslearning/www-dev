
# Notion MCP Server

A containerized version of "Notion MCP Server"

> Repository: [v-3/notion-server](https://github.com/v-3/notion-server)

## Description

A Model Context Protocol (MCP) server that provides seamless integration with Notion. This server enables Language Models to interact with your Notion workspace through standardized tools for searching, reading, creating, and updating pages and databases.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--v-3--notion-server--notion-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NOTION_API_KEY=notion-api-key \
ghcr.io/metorial/mcp-container--v-3--notion-server--notion-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NOTION_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "notion-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--v-3--notion-server--notion-server",
        "node ./build/index.js"
      ],
      "env": {
        "NOTION_API_KEY": "notion-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/v-3/notion-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  