
# Mac Messages MCP

A containerized version of "Mac Messages MCP"

> Repository: [carterlasalle/mac_messages_mcp](https://github.com/carterlasalle/mac_messages_mcp)

## Description

A Python bridge for interacting with the macOS Messages app using MCP (Multiple Context Protocol).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--carterlasalle--mac_messages_mcp--mac-messages-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--carterlasalle--mac_messages_mcp--mac-messages-mcp  "mac-messages-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mac-messages-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--carterlasalle--mac_messages_mcp--mac-messages-mcp",
        "mac-messages-mcp"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/carterlasalle/mac_messages_mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  