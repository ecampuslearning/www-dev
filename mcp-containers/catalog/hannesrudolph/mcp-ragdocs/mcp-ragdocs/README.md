
# RAG Documentation MCP Server

A containerized version of "RAG Documentation MCP Server"

> Repository: [hannesrudolph/mcp-ragdocs](https://github.com/hannesrudolph/mcp-ragdocs)

## Description

An MCP server implementation that provides tools for retrieving and processing documentation through vector search, enabling AI assistants to augment their responses with relevant documentation context.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hannesrudolph--mcp-ragdocs--mcp-ragdocs
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OPENAI_API_KEY=openai-api-key -e QDRANT_URL=qdrant-url -e QDRANT_API_KEY=qdrant-api-key \
ghcr.io/metorial/mcp-container--hannesrudolph--mcp-ragdocs--mcp-ragdocs  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OPENAI_API_KEY`
- `QDRANT_URL`
- `QDRANT_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-ragdocs": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hannesrudolph--mcp-ragdocs--mcp-ragdocs",
        "npm run start"
      ],
      "env": {
        "OPENAI_API_KEY": "openai-api-key",
        "QDRANT_URL": "qdrant-url",
        "QDRANT_API_KEY": "qdrant-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hannesrudolph/mcp-ragdocs) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  