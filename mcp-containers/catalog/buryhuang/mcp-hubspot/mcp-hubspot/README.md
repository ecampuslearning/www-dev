
# HubSpot MCP Server

A containerized version of "HubSpot MCP Server"

> Repository: [buryhuang/mcp-hubspot](https://github.com/buryhuang/mcp-hubspot)

## Description

A Model Context Protocol (MCP) server implementation that provides integration with HubSpot CRM. This server enables AI models to interact with HubSpot data and operations through a standardized interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--buryhuang--mcp-hubspot--mcp-hubspot
```

2. Run the container:

```bash
docker run -i --rm \ 
-e HUBSPOT_ACCESS_TOKEN=hubspot-access-token \
ghcr.io/metorial/mcp-container--buryhuang--mcp-hubspot--mcp-hubspot  "mcp-server-hubspot"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `HUBSPOT_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-hubspot": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--buryhuang--mcp-hubspot--mcp-hubspot",
        "mcp-server-hubspot"
      ],
      "env": {
        "HUBSPOT_ACCESS_TOKEN": "hubspot-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/buryhuang/mcp-hubspot) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  