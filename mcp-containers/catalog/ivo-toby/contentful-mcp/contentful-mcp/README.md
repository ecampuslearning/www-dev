
# Contentful MCP Server

A containerized version of "Contentful MCP Server"

> Repository: [ivo-toby/contentful-mcp](https://github.com/ivo-toby/contentful-mcp)

## Description

An MCP server implementation that integrates with Contentful's Content Management API, providing comprehensive content management capabilities.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ivo-toby--contentful-mcp--contentful-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CONTENTFUL_MANAGEMENT_ACCESS_TOKEN=contentful-management-access-token \
ghcr.io/metorial/mcp-container--ivo-toby--contentful-mcp--contentful-mcp  "node ./bin/mcp-server.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CONTENTFUL_MANAGEMENT_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "contentful-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ivo-toby--contentful-mcp--contentful-mcp",
        "node ./bin/mcp-server.js"
      ],
      "env": {
        "CONTENTFUL_MANAGEMENT_ACCESS_TOKEN": "contentful-management-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ivo-toby/contentful-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  