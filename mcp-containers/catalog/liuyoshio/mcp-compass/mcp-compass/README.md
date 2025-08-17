
# MCP Compass 🧭

A containerized version of "MCP Compass 🧭"

> Repository: [liuyoshio/mcp-compass](https://github.com/liuyoshio/mcp-compass)

## Description

MCP Discovery & Recommendation Service - Find the right MCP server for your needs


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--liuyoshio--mcp-compass--mcp-compass
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--liuyoshio--mcp-compass--mcp-compass  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-compass": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--liuyoshio--mcp-compass--mcp-compass",
        "node ./build/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/liuyoshio/mcp-compass) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  