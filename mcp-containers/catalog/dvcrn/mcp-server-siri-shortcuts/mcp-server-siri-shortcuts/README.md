
# Siri Shortcuts MCP Server

A containerized version of "Siri Shortcuts MCP Server"

> Repository: [dvcrn/mcp-server-siri-shortcuts](https://github.com/dvcrn/mcp-server-siri-shortcuts)

## Description

This MCP server provides access to Siri shortcuts functionality via the Model Context Protocol (MCP). It allows listing, opening, and running shortcuts from the macOS Shortcuts app.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--dvcrn--mcp-server-siri-shortcuts--mcp-server-siri-shortcuts
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--dvcrn--mcp-server-siri-shortcuts--mcp-server-siri-shortcuts  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-siri-shortcuts": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--dvcrn--mcp-server-siri-shortcuts--mcp-server-siri-shortcuts",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/dvcrn/mcp-server-siri-shortcuts) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  