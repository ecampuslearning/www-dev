
# Needle MCP Server

A containerized version of "Needle MCP Server"

> Repository: [needle-ai/needle-mcp](https://github.com/needle-ai/needle-mcp)

## Description

MCP (Model Context Protocol) server to manage documents and perform searches using [Needle](https://needle-ai.com) through Claude’s Desktop Application.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--needle-ai--needle-mcp--needle-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NEEDLE_API_KEY=needle-api-key \
ghcr.io/metorial/mcp-container--needle-ai--needle-mcp--needle-mcp  "needle-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NEEDLE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "needle-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--needle-ai--needle-mcp--needle-mcp",
        "needle-mcp"
      ],
      "env": {
        "NEEDLE_API_KEY": "needle-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/needle-ai/needle-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  