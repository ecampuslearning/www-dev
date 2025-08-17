
# Azure Resource Graph MCP Server

A containerized version of "Azure Resource Graph MCP Server"

> Repository: [hardik-id/azure-resource-graph-mcp-server](https://github.com/hardik-id/azure-resource-graph-mcp-server)

## Description

Model Context Protocol (MCP) server that provides access to Azure Resource Graph queries. It allows you to retrieve information about Azure resources across your subscriptions using Resource Graph queries.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hardik-id--azure-resource-graph-mcp-server--azure-resource-graph-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SUBSCRIPTION_ID=subscription-id \
ghcr.io/metorial/mcp-container--hardik-id--azure-resource-graph-mcp-server--azure-resource-graph-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SUBSCRIPTION_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "azure-resource-graph-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hardik-id--azure-resource-graph-mcp-server--azure-resource-graph-mcp-server",
        "npm run start"
      ],
      "env": {
        "SUBSCRIPTION_ID": "subscription-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hardik-id/azure-resource-graph-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  