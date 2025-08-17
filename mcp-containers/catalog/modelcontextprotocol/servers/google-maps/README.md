
# Google Maps MCP Server

A containerized version of "Google Maps MCP Server"

> Repository: [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers)

## Description

MCP Server for the Google Maps API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--google-maps
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GOOGLE_MAPS_API_KEY=google-maps-api-key \
ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--google-maps  "cd ./src/google-maps && node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GOOGLE_MAPS_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "google-maps": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--google-maps",
        "cd ./src/google-maps && node ./dist/index.js"
      ],
      "env": {
        "GOOGLE_MAPS_API_KEY": "google-maps-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/modelcontextprotocol/servers) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  