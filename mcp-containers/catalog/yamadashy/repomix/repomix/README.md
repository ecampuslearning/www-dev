
# Repomix MCP Server

A containerized version of "Repomix MCP Server"

> Repository: [yamadashy/repomix](https://github.com/yamadashy/repomix)

## Description

Pack your codebase into AI-friendly formats


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--yamadashy--repomix--repomix
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--yamadashy--repomix--repomix --mcp "node ./bin/repomix.cjs --mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "repomix": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--yamadashy--repomix--repomix",
        "node ./bin/repomix.cjs --mcp"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/yamadashy/repomix) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  