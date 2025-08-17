
# Mesh Agent MCP Server

A containerized version of "Mesh Agent MCP Server"

> Repository: [heurist-network/heurist-mesh-mcp-server](https://github.com/heurist-network/heurist-mesh-mcp-server)

## Description

A Model Context Protocol (MCP) server that connects to [Heurist Mesh](https://github.com/heurist-network/heurist-agent-framework/tree/main/mesh) APIs, providing Claude with access to various blockchain and web3 tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--heurist-network--heurist-mesh-mcp-server--heurist-mesh-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e HEURIST_API_KEY=heurist-api-key \
ghcr.io/metorial/mcp-container--heurist-network--heurist-mesh-mcp-server--heurist-mesh-mcp-server  "mesh-tool-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `HEURIST_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "heurist-mesh-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--heurist-network--heurist-mesh-mcp-server--heurist-mesh-mcp-server",
        "mesh-tool-server"
      ],
      "env": {
        "HEURIST_API_KEY": "heurist-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/heurist-network/heurist-mesh-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  