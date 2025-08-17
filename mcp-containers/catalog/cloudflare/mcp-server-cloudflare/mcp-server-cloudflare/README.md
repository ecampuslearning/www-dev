
# Cloudflare MCP Server

A containerized version of "Cloudflare MCP Server"

> Repository: [cloudflare/mcp-server-cloudflare](https://github.com/cloudflare/mcp-server-cloudflare)

## Description

Model Context Protocol (MCP) is a [new, standardized protocol](https://modelcontextprotocol.io/introduction) for managing context between large language models (LLMs) and external systems. In this repository, we provide an installer as well as an MCP Server for [Cloudflare's API](https://api.cloudflare.com).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--cloudflare--mcp-server-cloudflare--mcp-server-cloudflare
```

2. Run the container:

```bash
docker run -i --rm \ 
-e API_KEY=api-key \
ghcr.io/metorial/mcp-container--cloudflare--mcp-server-cloudflare--mcp-server-cloudflare  
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-cloudflare": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--cloudflare--mcp-server-cloudflare--mcp-server-cloudflare"
      ],
      "env": {
        "API_KEY": "api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/cloudflare/mcp-server-cloudflare) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  