
# Inbox Zero MCP Server

A containerized version of "Inbox Zero MCP Server"

> Repository: [elie222/inbox-zero](https://github.com/elie222/inbox-zero)

## Description

An MCP server to manage your inbox efficiently. Use it within Cursor, Windsurf, or Claude desktop to interact with your Inbox Zero personal assistant.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--elie222--inbox-zero--mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e API_KEY=api-key \
ghcr.io/metorial/mcp-container--elie222--inbox-zero--mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--elie222--inbox-zero--mcp-server",
        "npm run start"
      ],
      "env": {
        "API_KEY": "api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/elie222/inbox-zero) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  