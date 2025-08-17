
# Metoro MCP Server

A containerized version of "Metoro MCP Server"

> Repository: [metoro-io/metoro-mcp-server](https://github.com/metoro-io/metoro-mcp-server)

## Description

This repository contains th Metoro MCP (Model Context Protocol) Server. This MCP Server allows you to interact with your Kubernetes cluster via the Claude Desktop App!


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--metoro-io--metoro-mcp-server--metoro-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e METORO_AUTH_TOKEN=metoro-auth-token -e METORO_API_URL=metoro-api-url \
ghcr.io/metorial/mcp-container--metoro-io--metoro-mcp-server--metoro-mcp-server  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `METORO_AUTH_TOKEN`
- `METORO_API_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "metoro-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--metoro-io--metoro-mcp-server--metoro-mcp-server",
        "./out"
      ],
      "env": {
        "METORO_AUTH_TOKEN": "metoro-auth-token",
        "METORO_API_URL": "metoro-api-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/metoro-io/metoro-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  