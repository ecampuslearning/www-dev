
# Dexscreener MCP server

A containerized version of "Dexscreener MCP server"

> Repository: [janswist/mcp-dexscreener](https://github.com/janswist/mcp-dexscreener)

## Description

Basic MCP server for Dexscreener API based on their documentation (as of April 4th 2025): https://docs.dexscreener.com/api/reference


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--janswist--mcp-dexscreener--mcp-dexscreener
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--janswist--mcp-dexscreener--mcp-dexscreener  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-dexscreener": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--janswist--mcp-dexscreener--mcp-dexscreener",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/janswist/mcp-dexscreener) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  