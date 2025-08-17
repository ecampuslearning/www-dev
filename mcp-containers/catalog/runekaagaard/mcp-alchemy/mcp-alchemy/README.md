
# MCP Alchemy

A containerized version of "MCP Alchemy"

> Repository: [runekaagaard/mcp-alchemy](https://github.com/runekaagaard/mcp-alchemy)

## Description

An MCP server that gives the LLM access to and knowledge about relational databases like SQLite, Postgresql, MySQL & MariaDB, Oracle, and MS-SQL.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--runekaagaard--mcp-alchemy--mcp-alchemy
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DB_URL=db-url \
ghcr.io/metorial/mcp-container--runekaagaard--mcp-alchemy--mcp-alchemy  "mcp-alchemy"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DB_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-alchemy": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--runekaagaard--mcp-alchemy--mcp-alchemy",
        "mcp-alchemy"
      ],
      "env": {
        "DB_URL": "db-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/runekaagaard/mcp-alchemy) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  