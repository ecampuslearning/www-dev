
# Deepseek Thinker MCP Server

A containerized version of "Deepseek Thinker MCP Server"

> Repository: [ruixingshi/deepseek-thinker-mcp](https://github.com/ruixingshi/deepseek-thinker-mcp)

## Description

A MCP (Model Context Protocol) provider Deepseek reasoning content to MCP-enabled AI Clients, like Claude Desktop. Supports access to Deepseek's thought processes from the Deepseek API service or from a local Ollama server.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ruixingshi--deepseek-thinker-mcp--deepseek-thinker-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e API_KEY=api-key -e BASE_URL=base-url \
ghcr.io/metorial/mcp-container--ruixingshi--deepseek-thinker-mcp--deepseek-thinker-mcp  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `API_KEY`
- `BASE_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "deepseek-thinker-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ruixingshi--deepseek-thinker-mcp--deepseek-thinker-mcp",
        "node ./build/index.js"
      ],
      "env": {
        "API_KEY": "api-key",
        "BASE_URL": "base-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ruixingshi/deepseek-thinker-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  