
# DeepSeek MCP Server

A containerized version of "DeepSeek MCP Server"

> Repository: [DMontgomery40/deepseek-mcp-server](https://github.com/DMontgomery40/deepseek-mcp-server)

## Description

A Model Context Protocol (MCP) server for the DeepSeek API, allowing seamless integration of DeepSeek's powerful language models with MCP-compatible applications like Claude Desktop.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--dmontgomery40--deepseek-mcp-server--deepseek-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DEEPSEEK_API_KEY=deepseek-api-key \
ghcr.io/metorial/mcp-container--dmontgomery40--deepseek-mcp-server--deepseek-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DEEPSEEK_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "deepseek-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--dmontgomery40--deepseek-mcp-server--deepseek-mcp-server",
        "npm run start"
      ],
      "env": {
        "DEEPSEEK_API_KEY": "deepseek-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/DMontgomery40/deepseek-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  