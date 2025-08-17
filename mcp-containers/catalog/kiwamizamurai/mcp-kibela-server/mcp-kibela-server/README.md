
# Kibela MCP Server

A containerized version of "Kibela MCP Server"

> Repository: [kiwamizamurai/mcp-kibela-server](https://github.com/kiwamizamurai/mcp-kibela-server)

## Description

MCP server implementation for Kibela API integration, enabling LLMs to interact with Kibela content.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kiwamizamurai--mcp-kibela-server--mcp-kibela-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KIBELA_TEAM=kibela-team -e KIBELA_TOKEN=kibela-token \
ghcr.io/metorial/mcp-container--kiwamizamurai--mcp-kibela-server--mcp-kibela-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KIBELA_TEAM`
- `KIBELA_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-kibela-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kiwamizamurai--mcp-kibela-server--mcp-kibela-server",
        "npm run start"
      ],
      "env": {
        "KIBELA_TEAM": "kibela-team",
        "KIBELA_TOKEN": "kibela-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kiwamizamurai/mcp-kibela-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  