
# Bluesky Context Server

A containerized version of "Bluesky Context Server"

> Repository: [keturiosakys/bluesky-context-server](https://github.com/keturiosakys/bluesky-context-server)

## Description

A simple MCP server that can enable MCP clients to query Bluesky instances.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--keturiosakys--bluesky-context-server--bluesky-context-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e BLUESKY_APP_KEY=bluesky-app-key -e BLUESKY_IDENTIFIER=bluesky-identifier \
ghcr.io/metorial/mcp-container--keturiosakys--bluesky-context-server--bluesky-context-server  
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `BLUESKY_APP_KEY`
- `BLUESKY_IDENTIFIER`




## Usage with Claude

```json
{
  "mcpServers": {
    "bluesky-context-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--keturiosakys--bluesky-context-server--bluesky-context-server"
      ],
      "env": {
        "BLUESKY_APP_KEY": "bluesky-app-key",
        "BLUESKY_IDENTIFIER": "bluesky-identifier"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/keturiosakys/bluesky-context-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  