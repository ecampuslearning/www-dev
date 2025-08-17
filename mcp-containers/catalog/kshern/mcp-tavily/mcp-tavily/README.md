
# MCP Tavily

A containerized version of "MCP Tavily"

> Repository: [kshern/mcp-tavily](https://github.com/kshern/mcp-tavily)

## Description

A Model Context Protocol (MCP) server implementation for Tavily API, providing advanced search and content extraction capabilities.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kshern--mcp-tavily--mcp-tavily
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TAVILY_API_KEY=tavily-api-key \
ghcr.io/metorial/mcp-container--kshern--mcp-tavily--mcp-tavily  "node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TAVILY_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-tavily": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kshern--mcp-tavily--mcp-tavily",
        "node ./dist/index.js"
      ],
      "env": {
        "TAVILY_API_KEY": "tavily-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kshern/mcp-tavily) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  