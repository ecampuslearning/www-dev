
# Qdrant MCP server

A containerized version of "Qdrant MCP server"

> Repository: [qdrant/mcp-server-qdrant](https://github.com/qdrant/mcp-server-qdrant)

## Description

An official Qdrant Model Context Protocol (MCP) server implementation.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--qdrant--mcp-server-qdrant--mcp-server-qdrant
```

2. Run the container:

```bash
docker run -i --rm \ 
-e QDRANT_URL=qdrant-url -e QDRANT_API_KEY=qdrant-api-key -e COLLECTION_NAME=collection-name -e QDRANT_LOCAL_PATH=qdrant-local-path -e EMBEDDING_PROVIDER=embedding-provider -e EMBEDDING_MODEL=embedding-model -e TOOL_STORE_DESCRIPTION=tool-store-description \
ghcr.io/metorial/mcp-container--qdrant--mcp-server-qdrant--mcp-server-qdrant  "mcp-server-qdrant"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `QDRANT_URL`
- `QDRANT_API_KEY`
- `COLLECTION_NAME`
- `QDRANT_LOCAL_PATH`
- `EMBEDDING_PROVIDER`
- `EMBEDDING_MODEL`
- `TOOL_STORE_DESCRIPTION`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-qdrant": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--qdrant--mcp-server-qdrant--mcp-server-qdrant",
        "mcp-server-qdrant"
      ],
      "env": {
        "QDRANT_URL": "qdrant-url",
        "QDRANT_API_KEY": "qdrant-api-key",
        "COLLECTION_NAME": "collection-name",
        "QDRANT_LOCAL_PATH": "qdrant-local-path",
        "EMBEDDING_PROVIDER": "embedding-provider",
        "EMBEDDING_MODEL": "embedding-model",
        "TOOL_STORE_DESCRIPTION": "tool-store-description"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/qdrant/mcp-server-qdrant) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  