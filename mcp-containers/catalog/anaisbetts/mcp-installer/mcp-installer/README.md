
# mcp-installer - A MCP Server to install MCP Servers

A containerized version of "mcp-installer - A MCP Server to install MCP Servers"

> Repository: [anaisbetts/mcp-installer](https://github.com/anaisbetts/mcp-installer)

## Description

This server is a server that installs other MCP servers for you. Install it, and you can ask Claude to install MCP servers hosted in npm or PyPi for you. Requires npx and uv to be installed for node and Python servers respectively.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--anaisbetts--mcp-installer--mcp-installer
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--anaisbetts--mcp-installer--mcp-installer  "node ./lib/index.mjs"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-installer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--anaisbetts--mcp-installer--mcp-installer",
        "node ./lib/index.mjs"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/anaisbetts/mcp-installer) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  