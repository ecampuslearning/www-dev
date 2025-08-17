
# Calculator MCP Server

A containerized version of "Calculator MCP Server"

> Repository: [githejie/mcp-server-calculator](https://github.com/githejie/mcp-server-calculator)

## Description

A Model Context Protocol server for calculating. This server enables LLMs to use calculator for precise numerical calculations.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--githejie--mcp-server-calculator--mcp-server-calculator
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--githejie--mcp-server-calculator--mcp-server-calculator  "mcp-server-calculator"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-calculator": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--githejie--mcp-server-calculator--mcp-server-calculator",
        "mcp-server-calculator"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/githejie/mcp-server-calculator) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  