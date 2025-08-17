
# Chargebee MCP Server

A containerized version of "Chargebee MCP Server"

> Repository: [chargebee/agentkit](https://github.com/chargebee/agentkit)

## Description

Model Context Protocol (MCP) is a [standardized protocol](https://modelcontextprotocol.io/introduction) designed to manage context between large language models (LLMs) and external systems.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--chargebee--agentkit--modelcontextprotocol
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--chargebee--agentkit--modelcontextprotocol  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




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
        "ghcr.io/metorial/mcp-container--chargebee--agentkit--modelcontextprotocol",
        "node dist/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/chargebee/agentkit) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  