
# Oxylabs MCP Server

A containerized version of "Oxylabs MCP Server"

> Repository: [oxylabs/oxylabs-mcp](https://github.com/oxylabs/oxylabs-mcp)

## Description

The Oxylabs MCP server provides a bridge between AI models and the web. It enables them to scrape any URL, render JavaScript-heavy pages, extract and format content for AI use, bypass anti-scraping measures, and access geo-restricted web data from 195+ countries.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--oxylabs--oxylabs-mcp--oxylabs-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OXYLABS_USERNAME=oxylabs-username -e OXYLABS_PASSWORD=oxylabs-password \
ghcr.io/metorial/mcp-container--oxylabs--oxylabs-mcp--oxylabs-mcp  "oxylabs-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OXYLABS_USERNAME`
- `OXYLABS_PASSWORD`




## Usage with Claude

```json
{
  "mcpServers": {
    "oxylabs-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--oxylabs--oxylabs-mcp--oxylabs-mcp",
        "oxylabs-mcp"
      ],
      "env": {
        "OXYLABS_USERNAME": "oxylabs-username",
        "OXYLABS_PASSWORD": "oxylabs-password"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/oxylabs/oxylabs-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  