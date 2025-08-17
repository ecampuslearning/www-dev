
# Bing Search MCP Server

A containerized version of "Bing Search MCP Server"

> Repository: [leehanchung/bing-search-mcp](https://github.com/leehanchung/bing-search-mcp)

## Description

A Model Context Protocol (MCP) server for Microsoft Bing Search API integration, allowing AI assistants to perform web, news, and image searches.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--leehanchung--bing-search-mcp--bing-search-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e BING_API_KEY=bing-api-key \
ghcr.io/metorial/mcp-container--leehanchung--bing-search-mcp--bing-search-mcp  "mcp-server-bing"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `BING_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "bing-search-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--leehanchung--bing-search-mcp--bing-search-mcp",
        "mcp-server-bing"
      ],
      "env": {
        "BING_API_KEY": "bing-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/leehanchung/bing-search-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  