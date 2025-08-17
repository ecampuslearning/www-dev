
# Firecrawl MCP Server

A containerized version of "Firecrawl MCP Server"

> Repository: [vrknetha/mcp-server-firecrawl](https://github.com/vrknetha/mcp-server-firecrawl)

## Description

A Model Context Protocol (MCP) server implementation that integrates with [Firecrawl](https://github.com/mendableai/firecrawl) for web scraping capabilities.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--vrknetha--mcp-server-firecrawl--mcp-server-firecrawl
```

2. Run the container:

```bash
docker run -i --rm \ 
-e FIRECRAWL_API_KEY=firecrawl-api-key \
ghcr.io/metorial/mcp-container--vrknetha--mcp-server-firecrawl--mcp-server-firecrawl  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `FIRECRAWL_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-firecrawl": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--vrknetha--mcp-server-firecrawl--mcp-server-firecrawl",
        "npm run start"
      ],
      "env": {
        "FIRECRAWL_API_KEY": "firecrawl-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/vrknetha/mcp-server-firecrawl) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  