
# MCP Link - Convert Any OpenAPI V3 API to MCP Server

A containerized version of "MCP Link - Convert Any OpenAPI V3 API to MCP Server"

> Repository: [automation-ai-labs/mcp-link](https://github.com/automation-ai-labs/mcp-link)

## Description

Convert Any OpenAPI V3 API to MCP Server


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--automation-ai-labs--mcp-link--mcp-link
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--automation-ai-labs--mcp-link--mcp-link  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-link": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--automation-ai-labs--mcp-link--mcp-link",
        "./out"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/automation-ai-labs/mcp-link) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  