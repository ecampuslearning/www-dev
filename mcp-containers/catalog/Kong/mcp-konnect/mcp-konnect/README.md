
# Kong Konnect MCP Server

A containerized version of "Kong Konnect MCP Server"

> Repository: [Kong/mcp-konnect](https://github.com/Kong/mcp-konnect)

## Description

A Model Context Protocol (MCP) server for interacting with Kong Konnect APIs, allowing AI assistants to query and analyze Kong Gateway configurations, traffic, and analytics.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kong--mcp-konnect--mcp-konnect
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KONNECT_ACCESS_TOKEN=konnect-access-token -e KONNECT_REGION=konnect-region \
ghcr.io/metorial/mcp-container--kong--mcp-konnect--mcp-konnect  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KONNECT_ACCESS_TOKEN`
- `KONNECT_REGION`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-konnect": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kong--mcp-konnect--mcp-konnect",
        "npm run start"
      ],
      "env": {
        "KONNECT_ACCESS_TOKEN": "konnect-access-token",
        "KONNECT_REGION": "konnect-region"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Kong/mcp-konnect) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  