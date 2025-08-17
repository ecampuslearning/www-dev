
# mcp-server-sql-analyzer

A containerized version of "mcp-server-sql-analyzer"

> Repository: [j4c0bs/mcp-server-sql-analyzer](https://github.com/j4c0bs/mcp-server-sql-analyzer)

## Description

A Model Context Protocol (MCP) server that provides SQL analysis, linting, and dialect conversion capabilities using [SQLGlot](https://sqlglot.com/sqlglot.html).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--j4c0bs--mcp-server-sql-analyzer--mcp-server-sql-analyzer
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--j4c0bs--mcp-server-sql-analyzer--mcp-server-sql-analyzer  "mcp-server-sql-analyzer"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-sql-analyzer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--j4c0bs--mcp-server-sql-analyzer--mcp-server-sql-analyzer",
        "mcp-server-sql-analyzer"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/j4c0bs/mcp-server-sql-analyzer) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  