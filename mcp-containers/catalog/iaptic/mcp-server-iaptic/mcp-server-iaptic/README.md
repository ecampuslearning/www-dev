
# MCP Server for Iaptic

A containerized version of "MCP Server for Iaptic"

> Repository: [iaptic/mcp-server-iaptic](https://github.com/iaptic/mcp-server-iaptic)

## Description

A Model Context Protocol server for interacting with the [Iaptic API](https://www.iaptic.com). This server allows Claude or other AIs to interact with your Iaptic data to answer questions about your customers, purchases, transactions, and statistics.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--iaptic--mcp-server-iaptic--mcp-server-iaptic
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--iaptic--mcp-server-iaptic--mcp-server-iaptic  "npm run start --api-key api-key --app-name app-name"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--api-key`
- `--app-name`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-iaptic": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--iaptic--mcp-server-iaptic--mcp-server-iaptic",
        "npm run start --api-key api-key --app-name app-name"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/iaptic/mcp-server-iaptic) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  