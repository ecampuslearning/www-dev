
# Raindrop.io MCP Server

A containerized version of "Raindrop.io MCP Server"

> Repository: [hiromitsusasaki/raindrop-io-mcp-server](https://github.com/hiromitsusasaki/raindrop-io-mcp-server)

## Description

An integration that allows LLMs to interact with Raindrop.io bookmarks using the Model Context Protocol (MCP).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hiromitsusasaki--raindrop-io-mcp-server--raindrop-io-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e RAINDROP_TOKEN=raindrop-token \
ghcr.io/metorial/mcp-container--hiromitsusasaki--raindrop-io-mcp-server--raindrop-io-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `RAINDROP_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "raindrop-io-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hiromitsusasaki--raindrop-io-mcp-server--raindrop-io-mcp-server",
        "npm run start"
      ],
      "env": {
        "RAINDROP_TOKEN": "raindrop-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hiromitsusasaki/raindrop-io-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  