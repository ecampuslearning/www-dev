
# mcp-server-home-assistant

A containerized version of "mcp-server-home-assistant"

> Repository: [allenporter/mcp-server-home-assistant](https://github.com/allenporter/mcp-server-home-assistant)

## Description

A Model Context Protocol Server for Home Assistant. See [Model Context Protocol](https://modelcontextprotocol.io/)


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--allenporter--mcp-server-home-assistant--mcp-server-home-assistant
```

2. Run the container:

```bash
docker run -i --rm \ 
-e HOME_ASSISTANT_WEB_SOCKET_URL=home-assistant-web-socket-url \
ghcr.io/metorial/mcp-container--allenporter--mcp-server-home-assistant--mcp-server-home-assistant  "mcp-server-home-assistant"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `HOME_ASSISTANT_WEB_SOCKET_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-home-assistant": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--allenporter--mcp-server-home-assistant--mcp-server-home-assistant",
        "mcp-server-home-assistant"
      ],
      "env": {
        "HOME_ASSISTANT_WEB_SOCKET_URL": "home-assistant-web-socket-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/allenporter/mcp-server-home-assistant) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  