
# mcp-server-ledger: A Ledger CLI MCP Server

A containerized version of "mcp-server-ledger: A Ledger CLI MCP Server"

> Repository: [minhyeoky/mcp-server-ledger](https://github.com/minhyeoky/mcp-server-ledger)

## Description

A Model Context Protocol server for interacting with Ledger CLI, a powerful double-entry accounting system. This server enables Large Language Models to query and analyze financial data through a standardized interface, making it easy for AI assistants to help with financial reporting, budget analysis, and accounting tasks.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--minhyeoky--mcp-server-ledger--mcp-server-ledger
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--minhyeoky--mcp-server-ledger--mcp-server-ledger  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-ledger": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--minhyeoky--mcp-server-ledger--mcp-server-ledger",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/minhyeoky/mcp-server-ledger) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  