
# Tripadvisor MCP Server

A containerized version of "Tripadvisor MCP Server"

> Repository: [pab1it0/tripadvisor-mcp](https://github.com/pab1it0/tripadvisor-mcp)

## Description

An MCP server for Tripadvisor Content API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--pab1it0--tripadvisor-mcp--tripadvisor-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TRIPADVISOR_API_KEY=tripadvisor-api-key \
ghcr.io/metorial/mcp-container--pab1it0--tripadvisor-mcp--tripadvisor-mcp  "tripadvisor-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TRIPADVISOR_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "tripadvisor-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--pab1it0--tripadvisor-mcp--tripadvisor-mcp",
        "tripadvisor-mcp"
      ],
      "env": {
        "TRIPADVISOR_API_KEY": "tripadvisor-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/pab1it0/tripadvisor-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  