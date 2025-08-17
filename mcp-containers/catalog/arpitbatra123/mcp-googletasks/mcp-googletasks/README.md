
# Google Tasks MCP Server

A containerized version of "Google Tasks MCP Server"

> Repository: [arpitbatra123/mcp-googletasks](https://github.com/arpitbatra123/mcp-googletasks)

## Description

This Model Context Protocol (MCP) server provides a bridge between Claude and Google Tasks, allowing you to manage your task lists and tasks directly through Claude.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--arpitbatra123--mcp-googletasks--mcp-googletasks
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GOOGLE_CLIENT_ID=google-client-id -e GOOGLE_CLIENT_SECRET=google-client-secret -e GOOGLE_REDIRECT_URI=google-redirect-uri \
ghcr.io/metorial/mcp-container--arpitbatra123--mcp-googletasks--mcp-googletasks  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GOOGLE_CLIENT_ID`
- `GOOGLE_CLIENT_SECRET`
- `GOOGLE_REDIRECT_URI`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-googletasks": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--arpitbatra123--mcp-googletasks--mcp-googletasks",
        "node build/index.js"
      ],
      "env": {
        "GOOGLE_CLIENT_ID": "google-client-id",
        "GOOGLE_CLIENT_SECRET": "google-client-secret",
        "GOOGLE_REDIRECT_URI": "google-redirect-uri"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/arpitbatra123/mcp-googletasks) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  