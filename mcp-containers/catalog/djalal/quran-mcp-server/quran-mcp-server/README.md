
# MCP Server for Quran.com API

A containerized version of "MCP Server for Quran.com API"

> Repository: [djalal/quran-mcp-server](https://github.com/djalal/quran-mcp-server)

## Description

MCP server to interact with Quran.com corpus via the official [REST API v4](https://api-docs.quran.com/docs/content_apis_versioned/4.0.0/content-apis).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--djalal--quran-mcp-server--quran-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e API_KEY=api-key -e VERBOSE_MODE=verbose-mode \
ghcr.io/metorial/mcp-container--djalal--quran-mcp-server--quran-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `API_KEY`
- `VERBOSE_MODE`




## Usage with Claude

```json
{
  "mcpServers": {
    "quran-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--djalal--quran-mcp-server--quran-mcp-server",
        "npm run start"
      ],
      "env": {
        "API_KEY": "api-key",
        "VERBOSE_MODE": "verbose-mode"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/djalal/quran-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  