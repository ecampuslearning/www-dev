
# Okta MCP Server

A containerized version of "Okta MCP Server"

> Repository: [kapilduraphe/okta-mcp-server](https://github.com/kapilduraphe/okta-mcp-server)

## Description

This MCP server enables Claude to interact with Okta's user management system, providing user and group management capabilities.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kapilduraphe--okta-mcp-server--okta-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OKTA_ORG_URL=okta-org-url -e OKTA_API_TOKEN=okta-api-token \
ghcr.io/metorial/mcp-container--kapilduraphe--okta-mcp-server--okta-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OKTA_ORG_URL`
- `OKTA_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "okta-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kapilduraphe--okta-mcp-server--okta-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "OKTA_ORG_URL": "okta-org-url",
        "OKTA_API_TOKEN": "okta-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kapilduraphe/okta-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  