
# Xero MCP Server

A containerized version of "Xero MCP Server"

> Repository: [XeroAPI/xero-mcp-server](https://github.com/XeroAPI/xero-mcp-server)

## Description

This is a Model Context Protocol (MCP) server implementation for Xero. It provides a bridge between the MCP protocol and Xero's API, allowing for standardized access to Xero's accounting and business features.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--xeroapi--xero-mcp-server--xero-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e XERO_CLIENT_ID=xero-client-id -e XERO_CLIENT_SECRET=xero-client-secret \
ghcr.io/metorial/mcp-container--xeroapi--xero-mcp-server--xero-mcp-server  "node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `XERO_CLIENT_ID`
- `XERO_CLIENT_SECRET`




## Usage with Claude

```json
{
  "mcpServers": {
    "xero-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--xeroapi--xero-mcp-server--xero-mcp-server",
        "node ./dist/index.js"
      ],
      "env": {
        "XERO_CLIENT_ID": "xero-client-id",
        "XERO_CLIENT_SECRET": "xero-client-secret"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/XeroAPI/xero-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  