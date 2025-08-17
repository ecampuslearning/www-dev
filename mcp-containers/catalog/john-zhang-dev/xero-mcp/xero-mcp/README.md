
# Xero MCP Server

A containerized version of "Xero MCP Server"

> Repository: [john-zhang-dev/xero-mcp](https://github.com/john-zhang-dev/xero-mcp)

## Description

This MCP server allows Clients to interact with [Xero Accounting Software](https://www.xero.com).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--john-zhang-dev--xero-mcp--xero-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e XERO_CLIENT_ID=xero-client-id -e XERO_CLIENT_SECRET=xero-client-secret -e XERO_REDIRECT_URI=xero-redirect-uri \
ghcr.io/metorial/mcp-container--john-zhang-dev--xero-mcp--xero-mcp  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `XERO_CLIENT_ID`
- `XERO_CLIENT_SECRET`
- `XERO_REDIRECT_URI`




## Usage with Claude

```json
{
  "mcpServers": {
    "xero-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--john-zhang-dev--xero-mcp--xero-mcp",
        "node ./build/index.js"
      ],
      "env": {
        "XERO_CLIENT_ID": "xero-client-id",
        "XERO_CLIENT_SECRET": "xero-client-secret",
        "XERO_REDIRECT_URI": "xero-redirect-uri"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/john-zhang-dev/xero-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  