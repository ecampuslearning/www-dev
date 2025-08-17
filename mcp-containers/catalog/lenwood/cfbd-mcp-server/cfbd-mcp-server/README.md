
# College Football Data MCP Server

A containerized version of "College Football Data MCP Server"

> Repository: [lenwood/cfbd-mcp-server](https://github.com/lenwood/cfbd-mcp-server)

## Description

An MCP server implementation providing access to college football statistics sourced from the [College Football Data API](https://collegefootballdata.com/) within [Claude Desktop](https://claude.ai/download).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--lenwood--cfbd-mcp-server--cfbd-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CFB_API_KEY=cfb-api-key \
ghcr.io/metorial/mcp-container--lenwood--cfbd-mcp-server--cfbd-mcp-server cfbd-mcp-server "cfbd-mcp-server cfbd-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CFB_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "cfbd-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--lenwood--cfbd-mcp-server--cfbd-mcp-server",
        "cfbd-mcp-server cfbd-mcp-server"
      ],
      "env": {
        "CFB_API_KEY": "cfb-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/lenwood/cfbd-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  