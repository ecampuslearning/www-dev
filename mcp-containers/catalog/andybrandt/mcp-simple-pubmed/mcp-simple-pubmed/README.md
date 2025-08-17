
# MCP Simple PubMed

A containerized version of "MCP Simple PubMed"

> Repository: [andybrandt/mcp-simple-pubmed](https://github.com/andybrandt/mcp-simple-pubmed)

## Description

An MCP server that provides access to PubMed articles through the Entrez API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--andybrandt--mcp-simple-pubmed--mcp-simple-pubmed
```

2. Run the container:

```bash
docker run -i --rm \ 
-e PUBMED_EMAIL=pubmed-email -e PUBMED_API_KEY=pubmed-api-key \
ghcr.io/metorial/mcp-container--andybrandt--mcp-simple-pubmed--mcp-simple-pubmed  "mcp-simple-pubmed"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `PUBMED_EMAIL`
- `PUBMED_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-simple-pubmed": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--andybrandt--mcp-simple-pubmed--mcp-simple-pubmed",
        "mcp-simple-pubmed"
      ],
      "env": {
        "PUBMED_EMAIL": "pubmed-email",
        "PUBMED_API_KEY": "pubmed-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/andybrandt/mcp-simple-pubmed) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  