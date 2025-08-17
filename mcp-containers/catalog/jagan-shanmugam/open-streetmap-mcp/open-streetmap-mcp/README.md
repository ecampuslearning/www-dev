
# OpenStreetMap (OSM) MCP Server

A containerized version of "OpenStreetMap (OSM) MCP Server"

> Repository: [jagan-shanmugam/open-streetmap-mcp](https://github.com/jagan-shanmugam/open-streetmap-mcp)

## Description

An OpenStreetMap MCP server implementation that enhances LLM capabilities with location-based services and geospatial data.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jagan-shanmugam--open-streetmap-mcp--open-streetmap-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--jagan-shanmugam--open-streetmap-mcp--open-streetmap-mcp  "osm-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "open-streetmap-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jagan-shanmugam--open-streetmap-mcp--open-streetmap-mcp",
        "osm-mcp-server"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/jagan-shanmugam/open-streetmap-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  