
# Sentry MCP server

A containerized version of "Sentry MCP server"

> Repository: [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers)

## Description

Interact with Sentry using the Model Context Protocol (MCP).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--sentry
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--sentry --auth-token {{SENTRY_TOKEN}} "mcp-server-sentry --auth-token {{SENTRY_TOKEN}}"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `{{SENTRY_TOKEN}}`






## Usage with Claude

```json
{
  "mcpServers": {
    "sentry": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--sentry",
        "mcp-server-sentry --auth-token {{SENTRY_TOKEN}}"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/modelcontextprotocol/servers) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  