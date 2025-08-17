
# MCP-timeserver

A containerized version of "MCP-timeserver"

> Repository: [SecretiveShell/MCP-timeserver](https://github.com/SecretiveShell/MCP-timeserver)

## Description

A simple MCP server that exposes datetime information to agentic systems and chat REPLs


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--secretiveshell--mcp-timeserver--mcp-timeserver
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--secretiveshell--mcp-timeserver--mcp-timeserver  "mcp-timeserver"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-timeserver": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--secretiveshell--mcp-timeserver--mcp-timeserver",
        "mcp-timeserver"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/SecretiveShell/MCP-timeserver) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  