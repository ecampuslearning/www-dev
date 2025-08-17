
# Integration App MCP Server

A containerized version of "Integration App MCP Server"

> Repository: [integration-app/mcp-server](https://github.com/integration-app/mcp-server)

## Description

This is an implementation of the Model Context Protocol (MCP) server that exposes tools powered by Integration App.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--integration-app--mcp-server--mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e INTEGRATION_APP_TOKEN=integration-app-token -e INTEGRATION_KEY=integration-key \
ghcr.io/metorial/mcp-container--integration-app--mcp-server--mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `INTEGRATION_APP_TOKEN`
- `INTEGRATION_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--integration-app--mcp-server--mcp-server",
        "npm run start"
      ],
      "env": {
        "INTEGRATION_APP_TOKEN": "integration-app-token",
        "INTEGRATION_KEY": "integration-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/integration-app/mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  