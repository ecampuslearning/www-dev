
# holaspirit-mcp-server

A containerized version of "holaspirit-mcp-server"

> Repository: [syucream/holaspirit-mcp-server](https://github.com/syucream/holaspirit-mcp-server)

## Description

A [MCP(Model Context Protocol)](https://www.anthropic.com/news/model-context-protocol) server that accesses to [Holaspirit API](https://www.holaspirit.com/).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--syucream--holaspirit-mcp-server--holaspirit-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e HOLASPIRIT_API_TOKEN=holaspirit-api-token \
ghcr.io/metorial/mcp-container--syucream--holaspirit-mcp-server--holaspirit-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `HOLASPIRIT_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "holaspirit-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--syucream--holaspirit-mcp-server--holaspirit-mcp-server",
        "npm run start"
      ],
      "env": {
        "HOLASPIRIT_API_TOKEN": "holaspirit-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/syucream/holaspirit-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  