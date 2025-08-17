
# Netskope NPA MCP Server

A containerized version of "Netskope NPA MCP Server"

> Repository: [johnneerdael/netskope-mcp](https://github.com/johnneerdael/netskope-mcp)

## Description

A Model Context Protocol (MCP) server for managing Netskope Network Private Access (NPA) infrastructure through Large Language Models (LLMs).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--johnneerdael--netskope-mcp--netskope-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NETSKOPE_BASE_URL=netskope-base-url -e NETSKOPE_API_KEY=netskope-api-key \
ghcr.io/metorial/mcp-container--johnneerdael--netskope-mcp--netskope-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NETSKOPE_BASE_URL`
- `NETSKOPE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "netskope-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--johnneerdael--netskope-mcp--netskope-mcp",
        "npm run start"
      ],
      "env": {
        "NETSKOPE_BASE_URL": "netskope-base-url",
        "NETSKOPE_API_KEY": "netskope-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/johnneerdael/netskope-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  