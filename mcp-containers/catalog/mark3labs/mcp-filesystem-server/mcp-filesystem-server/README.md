
# Filesystem MCP Server

A containerized version of "Filesystem MCP Server"

> Repository: [mark3labs/mcp-filesystem-server](https://github.com/mark3labs/mcp-filesystem-server)

## Description

Go server implementing Model Context Protocol (MCP) for filesystem operations.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--mark3labs--mcp-filesystem-server--mcp-filesystem-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--mark3labs--mcp-filesystem-server--mcp-filesystem-server  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-filesystem-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--mark3labs--mcp-filesystem-server--mcp-filesystem-server",
        "./out"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/mark3labs/mcp-filesystem-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  