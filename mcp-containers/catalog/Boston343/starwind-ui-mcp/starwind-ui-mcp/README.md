
# Starwind UI MCP Server

A containerized version of "Starwind UI MCP Server"

> Repository: [Boston343/starwind-ui-mcp](https://github.com/Boston343/starwind-ui-mcp)

## Description

A TypeScript implementation of a Model Context Protocol (MCP) server for Starwind UI, providing tools to help developers work with Starwind UI components.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--boston343--starwind-ui-mcp--starwind-ui-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--boston343--starwind-ui-mcp--starwind-ui-mcp  "pnpm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "starwind-ui-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--boston343--starwind-ui-mcp--starwind-ui-mcp",
        "pnpm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Boston343/starwind-ui-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  