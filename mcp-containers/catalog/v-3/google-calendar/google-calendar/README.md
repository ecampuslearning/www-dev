
# Google Calendar MCP Server

A containerized version of "Google Calendar MCP Server"

> Repository: [v-3/google-calendar](https://github.com/v-3/google-calendar)

## Description

This MCP server allows Claude to interact with your Google Calendar, enabling capabilities like listing events, creating meetings, and finding free time slots.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--v-3--google-calendar--google-calendar
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GOOGLE_CLIENT_ID=google-client-id -e GOOGLE_CLIENT_SECRET=google-client-secret -e GOOGLE_REDIRECT_URI=google-redirect-uri -e GOOGLE_REFRESH_TOKEN=google-refresh-token \
ghcr.io/metorial/mcp-container--v-3--google-calendar--google-calendar  "node index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GOOGLE_CLIENT_ID`
- `GOOGLE_CLIENT_SECRET`
- `GOOGLE_REDIRECT_URI`
- `GOOGLE_REFRESH_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "google-calendar": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--v-3--google-calendar--google-calendar",
        "node index.js"
      ],
      "env": {
        "GOOGLE_CLIENT_ID": "google-client-id",
        "GOOGLE_CLIENT_SECRET": "google-client-secret",
        "GOOGLE_REDIRECT_URI": "google-redirect-uri",
        "GOOGLE_REFRESH_TOKEN": "google-refresh-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/v-3/google-calendar) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  