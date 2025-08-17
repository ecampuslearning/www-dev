
# n8n MCP Server

A containerized version of "n8n MCP Server"

> Repository: [leonardsellem/n8n-mcp-server](https://github.com/leonardsellem/n8n-mcp-server)

## Description

A Model Context Protocol (MCP) server that allows AI assistants to interact with n8n workflows through natural language.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--leonardsellem--n8n-mcp-server--n-8-n-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e N8N_API_URL=n-8-n-api-url -e N8N_API_KEY=n-8-n-api-key -e N8N_WEBHOOK_USERNAME=n-8-n-webhook-username -e N8N_WEBHOOK_PASSWORD=n-8-n-webhook-password \
ghcr.io/metorial/mcp-container--leonardsellem--n8n-mcp-server--n-8-n-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `N8N_API_URL`
- `N8N_API_KEY`
- `N8N_WEBHOOK_USERNAME`
- `N8N_WEBHOOK_PASSWORD`




## Usage with Claude

```json
{
  "mcpServers": {
    "n-8-n-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--leonardsellem--n8n-mcp-server--n-8-n-mcp-server",
        "npm run start"
      ],
      "env": {
        "N8N_API_URL": "n-8-n-api-url",
        "N8N_API_KEY": "n-8-n-api-key",
        "N8N_WEBHOOK_USERNAME": "n-8-n-webhook-username",
        "N8N_WEBHOOK_PASSWORD": "n-8-n-webhook-password"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/leonardsellem/n8n-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  