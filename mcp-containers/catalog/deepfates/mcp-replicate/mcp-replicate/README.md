
# Replicate MCP Server

A containerized version of "Replicate MCP Server"

> Repository: [deepfates/mcp-replicate](https://github.com/deepfates/mcp-replicate)

## Description

A [Model Context Protocol](https://github.com/mcp-sdk/mcp) server implementation for Replicate. Run Replicate models through a simple tool-based interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--deepfates--mcp-replicate--mcp-replicate
```

2. Run the container:

```bash
docker run -i --rm \ 
-e REPLICATE_API_TOKEN=replicate-api-token \
ghcr.io/metorial/mcp-container--deepfates--mcp-replicate--mcp-replicate  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `REPLICATE_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-replicate": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--deepfates--mcp-replicate--mcp-replicate",
        "npm run start"
      ],
      "env": {
        "REPLICATE_API_TOKEN": "replicate-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/deepfates/mcp-replicate) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  