
# MCP Server for Asana

A containerized version of "MCP Server for Asana"

> Repository: [roychri/mcp-server-asana](https://github.com/roychri/mcp-server-asana)

## Description

This Model Context Protocol server implementation of Asana allows you


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--roychri--mcp-server-asana--mcp-server-asana
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ASANA_ACCESS_TOKEN=asana-access-token \
ghcr.io/metorial/mcp-container--roychri--mcp-server-asana--mcp-server-asana  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ASANA_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-asana": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--roychri--mcp-server-asana--mcp-server-asana",
        "npm run start"
      ],
      "env": {
        "ASANA_ACCESS_TOKEN": "asana-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/roychri/mcp-server-asana) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  