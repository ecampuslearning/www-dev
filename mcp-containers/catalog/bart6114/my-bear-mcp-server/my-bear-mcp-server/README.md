
# Bear MCP Server

A containerized version of "Bear MCP Server"

> Repository: [bart6114/my-bear-mcp-server](https://github.com/bart6114/my-bear-mcp-server)

## Description

A Model Context Protocol (MCP) server that allows AI assistants like Claude to read notes from the [Bear](https://bear.app/) note-taking app. This implementation connects directly to the Bear SQLite database in a read-only mode, ensuring your notes remain safe and unmodified.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--bart6114--my-bear-mcp-server--my-bear-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--bart6114--my-bear-mcp-server--my-bear-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "my-bear-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--bart6114--my-bear-mcp-server--my-bear-mcp-server",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/bart6114/my-bear-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  