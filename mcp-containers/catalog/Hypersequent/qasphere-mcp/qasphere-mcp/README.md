
# QA Sphere MCP Server

A containerized version of "QA Sphere MCP Server"

> Repository: [Hypersequent/qasphere-mcp](https://github.com/Hypersequent/qasphere-mcp)

## Description

A [Model Context Protocol](https://github.com/modelcontextprotocol) server for the [QA Sphere](https://qasphere.com/) test management system.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hypersequent--qasphere-mcp--qasphere-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e QASPHERE_TENANT_URL=qasphere-tenant-url -e QASPHERE_API_KEY=qasphere-api-key \
ghcr.io/metorial/mcp-container--hypersequent--qasphere-mcp--qasphere-mcp  "node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `QASPHERE_TENANT_URL`
- `QASPHERE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "qasphere-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hypersequent--qasphere-mcp--qasphere-mcp",
        "node ./dist/index.js"
      ],
      "env": {
        "QASPHERE_TENANT_URL": "qasphere-tenant-url",
        "QASPHERE_API_KEY": "qasphere-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Hypersequent/qasphere-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  