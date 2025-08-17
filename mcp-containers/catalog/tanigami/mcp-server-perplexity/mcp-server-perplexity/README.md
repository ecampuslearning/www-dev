
# Perplexity MCP Server

A containerized version of "Perplexity MCP Server"

> Repository: [tanigami/mcp-server-perplexity](https://github.com/tanigami/mcp-server-perplexity)

## Description

MCP Server for the Perplexity API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--tanigami--mcp-server-perplexity--mcp-server-perplexity
```

2. Run the container:

```bash
docker run -i --rm \ 
-e PERPLEXITY_API_KEY=perplexity-api-key \
ghcr.io/metorial/mcp-container--tanigami--mcp-server-perplexity--mcp-server-perplexity  "mcp-server-perplexity"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `PERPLEXITY_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-perplexity": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--tanigami--mcp-server-perplexity--mcp-server-perplexity",
        "mcp-server-perplexity"
      ],
      "env": {
        "PERPLEXITY_API_KEY": "perplexity-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/tanigami/mcp-server-perplexity) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  