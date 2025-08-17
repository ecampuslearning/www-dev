
# mcp-server-duckdb

A containerized version of "mcp-server-duckdb"

> Repository: [ktanaka101/mcp-server-duckdb](https://github.com/ktanaka101/mcp-server-duckdb)

## Description

A Model Context Protocol (MCP) server implementation for DuckDB, providing database interaction capabilities through MCP tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ktanaka101--mcp-server-duckdb--mcp-server-duckdb
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--ktanaka101--mcp-server-duckdb--mcp-server-duckdb  "mcp-server-duckdb"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-duckdb": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ktanaka101--mcp-server-duckdb--mcp-server-duckdb",
        "mcp-server-duckdb"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ktanaka101/mcp-server-duckdb) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  