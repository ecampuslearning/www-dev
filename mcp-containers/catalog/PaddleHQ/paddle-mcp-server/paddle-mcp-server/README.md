
# Paddle MCP Server

A containerized version of "Paddle MCP Server"

> Repository: [PaddleHQ/paddle-mcp-server](https://github.com/PaddleHQ/paddle-mcp-server)

## Description

This is a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/introduction) server that provides tools for interacting with the Paddle API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--paddlehq--paddle-mcp-server--paddle-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--paddlehq--paddle-mcp-server--paddle-mcp-server  "node ./build/index.js --api-key paddle-api-key --environment paddle-environment"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--api-key`
- `--environment`






## Usage with Claude

```json
{
  "mcpServers": {
    "paddle-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--paddlehq--paddle-mcp-server--paddle-mcp-server",
        "node ./build/index.js --api-key paddle-api-key --environment paddle-environment"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/PaddleHQ/paddle-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  