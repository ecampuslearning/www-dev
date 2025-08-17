
# MCP Server Giphy

A containerized version of "MCP Server Giphy"

> Repository: [magarcia/mcp-server-giphy](https://github.com/magarcia/mcp-server-giphy)

## Description

MCP Server for the Giphy API, enabling AI models to search, retrieve, and utilize GIFs from Giphy.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--magarcia--mcp-server-giphy--mcp-server-giphy
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GIPHY_API_KEY=giphy-api-key \
ghcr.io/metorial/mcp-container--magarcia--mcp-server-giphy--mcp-server-giphy  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GIPHY_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-giphy": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--magarcia--mcp-server-giphy--mcp-server-giphy",
        "npm run start"
      ],
      "env": {
        "GIPHY_API_KEY": "giphy-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/magarcia/mcp-server-giphy) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  