
# Webflow MCP Server

A containerized version of "Webflow MCP Server"

> Repository: [kapilduraphe/webflow-mcp-server](https://github.com/kapilduraphe/webflow-mcp-server)

## Description

This MCP server enables Claude to interact with Webflow's APIs.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kapilduraphe--webflow-mcp-server--webflow-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e WEBFLOW_API_TOKEN=webflow-api-token \
ghcr.io/metorial/mcp-container--kapilduraphe--webflow-mcp-server--webflow-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `WEBFLOW_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "webflow-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kapilduraphe--webflow-mcp-server--webflow-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "WEBFLOW_API_TOKEN": "webflow-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kapilduraphe/webflow-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  