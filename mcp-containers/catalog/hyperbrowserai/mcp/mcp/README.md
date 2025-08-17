
# Hyperbrowser MCP Server

A containerized version of "Hyperbrowser MCP Server"

> Repository: [hyperbrowserai/mcp](https://github.com/hyperbrowserai/mcp)

## Description

This is Hyperbrowser's Model Context Protocol (MCP) Server. It provides various tools to scrape, extract structured data, and crawl webpages. It also provides easy access to general purpose browser agents like OpenAI's CUA, Anthropic's Claude Computer Use, and Browser Use.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hyperbrowserai--mcp--mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e HYPERBROWSER_API_KEY=hyperbrowser-api-key \
ghcr.io/metorial/mcp-container--hyperbrowserai--mcp--mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `HYPERBROWSER_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hyperbrowserai--mcp--mcp",
        "npm run start"
      ],
      "env": {
        "HYPERBROWSER_API_KEY": "hyperbrowser-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hyperbrowserai/mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  