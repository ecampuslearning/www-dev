
# PubMed Enhanced Search MCP Server

A containerized version of "PubMed Enhanced Search MCP Server"

> Repository: [leescot/pubmed-mcp-smithery](https://github.com/leescot/pubmed-mcp-smithery)

## Description

A Model Content Protocol server that provides enhanced tools to search and retrieve academic papers from PubMed database, with additional features such as MeSH term lookup, publication count statistics, and PICO-based evidence search.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--leescot--pubmed-mcp-smithery--pubmed-mcp-smithery
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--leescot--pubmed-mcp-smithery--pubmed-mcp-smithery  "python pubmed_enhanced_mcp_server.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "pubmed-mcp-smithery": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--leescot--pubmed-mcp-smithery--pubmed-mcp-smithery",
        "python pubmed_enhanced_mcp_server.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/leescot/pubmed-mcp-smithery) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  