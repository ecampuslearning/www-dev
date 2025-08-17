
# Vectorize MCP Server

A containerized version of "Vectorize MCP Server"

> Repository: [vectorize-io/vectorize-mcp-server](https://github.com/vectorize-io/vectorize-mcp-server/)

## Description

A Model Context Protocol (MCP) server implementation that integrates with [Vectorize](https://vectorize.io/) for advanced Vector retrieval and text extraction.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--vectorize-io--vectorize-mcp-server--vectorize-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e VECTORIZE_ORG_ID=vectorize-org-id -e VECTORIZE_TOKEN=vectorize-token -e VECTORIZE_PIPELINE_ID=vectorize-pipeline-id \
ghcr.io/metorial/mcp-container--vectorize-io--vectorize-mcp-server--vectorize-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `VECTORIZE_ORG_ID`
- `VECTORIZE_TOKEN`
- `VECTORIZE_PIPELINE_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "vectorize-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--vectorize-io--vectorize-mcp-server--vectorize-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "VECTORIZE_ORG_ID": "vectorize-org-id",
        "VECTORIZE_TOKEN": "vectorize-token",
        "VECTORIZE_PIPELINE_ID": "vectorize-pipeline-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/vectorize-io/vectorize-mcp-server/) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  