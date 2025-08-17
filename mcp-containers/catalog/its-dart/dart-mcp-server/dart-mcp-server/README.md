
# Dart MCP Server

A containerized version of "Dart MCP Server"

> Repository: [its-dart/dart-mcp-server](https://github.com/its-dart/dart-mcp-server)

## Description

Dart AI Model Context Protocol (MCP) server


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--its-dart--dart-mcp-server--dart-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DART_TOKEN=dart-token \
ghcr.io/metorial/mcp-container--its-dart--dart-mcp-server--dart-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DART_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "dart-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--its-dart--dart-mcp-server--dart-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "DART_TOKEN": "dart-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/its-dart/dart-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  