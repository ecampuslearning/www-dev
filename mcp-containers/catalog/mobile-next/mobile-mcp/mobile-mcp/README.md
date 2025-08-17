
# # Mobile Next - MCP server for Mobile Automation

A containerized version of "# Mobile Next - MCP server for Mobile Automation"

> Repository: [mobile-next/mobile-mcp](https://github.com/mobile-next/mobile-mcp)

## Description

This is a [Model Context Protocol (MCP) server](https://github.com/modelcontextprotocol) that enables scalable mobile automation through a platform-agnostic interface, eliminating the need for distinct iOS or Android knowledge.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--mobile-next--mobile-mcp--mobile-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--mobile-next--mobile-mcp--mobile-mcp  "node lib/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mobile-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--mobile-next--mobile-mcp--mobile-mcp",
        "node lib/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/mobile-next/mobile-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  