
# Starrocks Official MCP server

A containerized version of "Starrocks Official MCP server"

> Repository: [StarRocks/mcp-server-starrocks](https://github.com/StarRocks/mcp-server-starrocks)

## Description

The StarRocks MCP Server acts as a bridge between AI assistants and StarRocks databases, allowing for direct SQL execution and database exploration without requiring complex setup or configuration.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--starrocks--mcp-server-starrocks--mcp-server-starrocks
```

2. Run the container:

```bash
docker run -i --rm \ 
-e STARROCKS_HOST=starrocks-host -e STARROCKS_PORT=starrocks-port -e STARROCKS_USER=starrocks-user -e STARROCKS_PASSWORD=starrocks-password \
ghcr.io/metorial/mcp-container--starrocks--mcp-server-starrocks--mcp-server-starrocks mcp-server-starrocks "mcp-server-starrocks mcp-server-starrocks"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `STARROCKS_HOST`
- `STARROCKS_PORT`
- `STARROCKS_USER`
- `STARROCKS_PASSWORD`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-starrocks": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--starrocks--mcp-server-starrocks--mcp-server-starrocks",
        "mcp-server-starrocks mcp-server-starrocks"
      ],
      "env": {
        "STARROCKS_HOST": "starrocks-host",
        "STARROCKS_PORT": "starrocks-port",
        "STARROCKS_USER": "starrocks-user",
        "STARROCKS_PASSWORD": "starrocks-password"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/StarRocks/mcp-server-starrocks) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  