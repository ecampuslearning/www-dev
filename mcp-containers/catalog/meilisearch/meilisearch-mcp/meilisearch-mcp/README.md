
# Meilisearch MCP Server

A containerized version of "Meilisearch MCP Server"

> Repository: [meilisearch/meilisearch-mcp](https://github.com/meilisearch/meilisearch-mcp)

## Description

A Model Context Protocol (MCP) server for interacting with Meilisearch through LLM interfaces like Claude.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--meilisearch--meilisearch-mcp--meilisearch-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MEILI_HTTP_ADDR=Meilisearch HTTP Address -e MEILI_MASTER_KEY=Meilisearch Master Key \
ghcr.io/metorial/mcp-container--meilisearch--meilisearch-mcp--meilisearch-mcp  "python -m src.meilisearch_mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MEILI_HTTP_ADDR`
- `MEILI_MASTER_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "meilisearch-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--meilisearch--meilisearch-mcp--meilisearch-mcp",
        "python -m src.meilisearch_mcp"
      ],
      "env": {
        "MEILI_HTTP_ADDR": "Meilisearch HTTP Address",
        "MEILI_MASTER_KEY": "Meilisearch Master Key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/meilisearch/meilisearch-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  