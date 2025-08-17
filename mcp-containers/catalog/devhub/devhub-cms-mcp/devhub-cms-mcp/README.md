
# DevHub CMS MCP Server

A containerized version of "DevHub CMS MCP Server"

> Repository: [devhub/devhub-cms-mcp](https://github.com/devhub/devhub-cms-mcp)

## Description

A [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) integration for managing content in the [DevHub CMS system](https://www.devhub.com/).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--devhub--devhub-cms-mcp--devhub-cms-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DEVHUB_API_KEY=devhub-api-key -e DEVHUB_API_SECRET=devhub-api-secret -e DEVHUB_BASE_URL=devhub-base-url \
ghcr.io/metorial/mcp-container--devhub--devhub-cms-mcp--devhub-cms-mcp  "devhub-cms-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DEVHUB_API_KEY`
- `DEVHUB_API_SECRET`
- `DEVHUB_BASE_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "devhub-cms-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--devhub--devhub-cms-mcp--devhub-cms-mcp",
        "devhub-cms-mcp"
      ],
      "env": {
        "DEVHUB_API_KEY": "devhub-api-key",
        "DEVHUB_API_SECRET": "devhub-api-secret",
        "DEVHUB_BASE_URL": "devhub-base-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/devhub/devhub-cms-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  