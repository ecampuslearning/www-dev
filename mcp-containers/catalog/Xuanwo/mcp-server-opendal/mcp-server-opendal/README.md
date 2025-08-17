
# Model Context Protocol Server for Apache OpenDAL™

A containerized version of "Model Context Protocol Server for Apache OpenDAL™"

> Repository: [Xuanwo/mcp-server-opendal](https://github.com/Xuanwo/mcp-server-opendal)

## Description

A Model Context Protocol (MCP) server implementation that provides access to various storage services via [Apache OpenDAL™](https://opendal.apache.org/).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--xuanwo--mcp-server-opendal--mcp-server-opendal
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--xuanwo--mcp-server-opendal--mcp-server-opendal  "mcp-server-opendal"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-opendal": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--xuanwo--mcp-server-opendal--mcp-server-opendal",
        "mcp-server-opendal"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Xuanwo/mcp-server-opendal) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  