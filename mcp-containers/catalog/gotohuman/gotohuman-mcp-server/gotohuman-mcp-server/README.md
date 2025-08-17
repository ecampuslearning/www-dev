
# gotoHuman MCP Server

A containerized version of "gotoHuman MCP Server"

> Repository: [gotohuman/gotohuman-mcp-server](https://github.com/gotohuman/gotohuman-mcp-server)

## Description

Let your **AI agents ask for human reviews** in gotoHuman via MCP.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--gotohuman--gotohuman-mcp-server--gotohuman-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GOTOHUMAN_API_KEY=gotohuman-api-key \
ghcr.io/metorial/mcp-container--gotohuman--gotohuman-mcp-server--gotohuman-mcp-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GOTOHUMAN_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "gotohuman-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--gotohuman--gotohuman-mcp-server--gotohuman-mcp-server",
        "node ./build/index.js"
      ],
      "env": {
        "GOTOHUMAN_API_KEY": "gotohuman-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/gotohuman/gotohuman-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  