
# Freshdesk MCP Server

A containerized version of "Freshdesk MCP Server"

> Repository: [effytech/freshdesk_mcp](https://github.com/effytech/freshdesk_mcp)

## Description

An MCP server implementation that integrates with Freshdesk, enabling AI models to interact with Freshdesk modules and perform various support operations.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--effytech--freshdesk_mcp--freshdesk-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e FRESHDESK_API_KEY=freshdesk-api-key -e FRESHDESK_DOMAIN=freshdesk-domain \
ghcr.io/metorial/mcp-container--effytech--freshdesk_mcp--freshdesk-mcp  "freshdesk-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `FRESHDESK_API_KEY`
- `FRESHDESK_DOMAIN`




## Usage with Claude

```json
{
  "mcpServers": {
    "freshdesk-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--effytech--freshdesk_mcp--freshdesk-mcp",
        "freshdesk-mcp"
      ],
      "env": {
        "FRESHDESK_API_KEY": "freshdesk-api-key",
        "FRESHDESK_DOMAIN": "freshdesk-domain"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/effytech/freshdesk_mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  