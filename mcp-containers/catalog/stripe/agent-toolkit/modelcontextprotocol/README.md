
# Stripe MCP Server

A containerized version of "Stripe MCP Server"

> Repository: [stripe/agent-toolkit](https://github.com/stripe/agent-toolkit)

## Description

The Stripe [Model Context Protocol](https://modelcontextprotocol.com/) server allows you to integrate with Stripe APIs through function calling. This protocol supports various tools to interact with different Stripe services.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--stripe--agent-toolkit--modelcontextprotocol
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--stripe--agent-toolkit--modelcontextprotocol  "node dist/index.js --tools tools --api-key api-key"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--tools`
- `--api-key`






## Usage with Claude

```json
{
  "mcpServers": {
    "modelcontextprotocol": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--stripe--agent-toolkit--modelcontextprotocol",
        "node dist/index.js --tools tools --api-key api-key"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/stripe/agent-toolkit) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  