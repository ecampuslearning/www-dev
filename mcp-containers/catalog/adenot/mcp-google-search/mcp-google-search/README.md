
# Google Search MCP Server

A containerized version of "Google Search MCP Server"

> Repository: [adenot/mcp-google-search](https://github.com/adenot/mcp-google-search)

## Description

A Model Context Protocol server that provides web search capabilities using Google Custom Search API and webpage content extraction functionality.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--adenot--mcp-google-search--mcp-google-search
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GOOGLE_API_KEY=google-api-key -e GOOGLE_SEARCH_ENGINE_ID=google-search-engine-id \
ghcr.io/metorial/mcp-container--adenot--mcp-google-search--mcp-google-search  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GOOGLE_API_KEY`
- `GOOGLE_SEARCH_ENGINE_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-google-search": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--adenot--mcp-google-search--mcp-google-search",
        "node ./build/index.js"
      ],
      "env": {
        "GOOGLE_API_KEY": "google-api-key",
        "GOOGLE_SEARCH_ENGINE_ID": "google-search-engine-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/adenot/mcp-google-search) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  