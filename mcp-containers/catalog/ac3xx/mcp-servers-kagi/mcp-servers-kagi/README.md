
# kagi-server MCP Server

A containerized version of "kagi-server MCP Server"

> Repository: [ac3xx/mcp-servers-kagi](https://github.com/ac3xx/mcp-servers-kagi)

## Description

MCP server for Kagi API integration


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ac3xx--mcp-servers-kagi--mcp-servers-kagi
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KAGI_API_KEY=kagi-api-key \
ghcr.io/metorial/mcp-container--ac3xx--mcp-servers-kagi--mcp-servers-kagi  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KAGI_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-servers-kagi": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ac3xx--mcp-servers-kagi--mcp-servers-kagi",
        "node ./build/index.js"
      ],
      "env": {
        "KAGI_API_KEY": "kagi-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ac3xx/mcp-servers-kagi) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  