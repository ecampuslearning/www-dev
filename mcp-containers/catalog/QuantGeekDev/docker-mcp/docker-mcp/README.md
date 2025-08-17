
# Docker MCP

A containerized version of "Docker MCP"

> Repository: [QuantGeekDev/docker-mcp](https://github.com/QuantGeekDev/docker-mcp)

## Description

A powerful Model Context Protocol (MCP) server for Docker operations, enabling seamless container and compose stack management through Claude AI.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--quantgeekdev--docker-mcp--docker-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--quantgeekdev--docker-mcp--docker-mcp  "docker-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "docker-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--quantgeekdev--docker-mcp--docker-mcp",
        "docker-mcp"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/QuantGeekDev/docker-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  