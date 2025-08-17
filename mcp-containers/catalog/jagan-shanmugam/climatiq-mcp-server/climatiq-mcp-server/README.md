
# Climatiq MCP Server

A containerized version of "Climatiq MCP Server"

> Repository: [jagan-shanmugam/climatiq-mcp-server](https://github.com/jagan-shanmugam/climatiq-mcp-server)

## Description

A Model Context Protocol (MCP) server for accessing the Climatiq API to calculate carbon emissions. This allows AI assistants to perform real-time carbon calculations and provide climate impact insights.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jagan-shanmugam--climatiq-mcp-server--climatiq-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CLIMATIQ_API_KEY=climatiq-api-key \
ghcr.io/metorial/mcp-container--jagan-shanmugam--climatiq-mcp-server--climatiq-mcp-server  "climatiq-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CLIMATIQ_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "climatiq-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jagan-shanmugam--climatiq-mcp-server--climatiq-mcp-server",
        "climatiq-mcp-server"
      ],
      "env": {
        "CLIMATIQ_API_KEY": "climatiq-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/jagan-shanmugam/climatiq-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  