
# MCP Server Kubernetes

A containerized version of "MCP Server Kubernetes"

> Repository: [Flux159/mcp-server-kubernetes](https://github.com/Flux159/mcp-server-kubernetes)

## Description

MCP Server that can connect to a Kubernetes cluster and manage it.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--flux159--mcp-server-kubernetes--mcp-server-kubernetes
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--flux159--mcp-server-kubernetes--mcp-server-kubernetes  "bun run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-kubernetes": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--flux159--mcp-server-kubernetes--mcp-server-kubernetes",
        "bun run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Flux159/mcp-server-kubernetes) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  