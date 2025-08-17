
# Confluence Communication Server MCP Server

A containerized version of "Confluence Communication Server MCP Server"

> Repository: [KS-GEN-AI/confluence-mcp-server](https://github.com/KS-GEN-AI/confluence-mcp-server)

## Description

Interact with Confluence


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ks-gen-ai--confluence-mcp-server--confluence-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CONFLUENCE_URL=confluence-url -e CONFLUENCE_API_MAIL=confluence-api-mail -e CONFLUENCE_API_KEY=confluence-api-key \
ghcr.io/metorial/mcp-container--ks-gen-ai--confluence-mcp-server--confluence-mcp-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CONFLUENCE_URL`
- `CONFLUENCE_API_MAIL`
- `CONFLUENCE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "confluence-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ks-gen-ai--confluence-mcp-server--confluence-mcp-server",
        "node ./build/index.js"
      ],
      "env": {
        "CONFLUENCE_URL": "confluence-url",
        "CONFLUENCE_API_MAIL": "confluence-api-mail",
        "CONFLUENCE_API_KEY": "confluence-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/KS-GEN-AI/confluence-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  