
# attio-mcp-server

A containerized version of "attio-mcp-server"

> Repository: [hmk/attio-mcp-server](https://github.com/hmk/attio-mcp-server)

## Description

This is an MCP server for [Attio](https://attio.com/), the AI-native CRM. It allows mcp clients (like Claude) to connect to the Attio API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hmk--attio-mcp-server--attio-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ATTIO_API_KEY=attio-api-key \
ghcr.io/metorial/mcp-container--hmk--attio-mcp-server--attio-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ATTIO_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "attio-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hmk--attio-mcp-server--attio-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "ATTIO_API_KEY": "attio-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hmk/attio-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  