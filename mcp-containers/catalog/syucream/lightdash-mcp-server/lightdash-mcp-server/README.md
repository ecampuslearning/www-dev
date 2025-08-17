
# lightdash-mcp-server

A containerized version of "lightdash-mcp-server"

> Repository: [syucream/lightdash-mcp-server](https://github.com/syucream/lightdash-mcp-server)

## Description

A [MCP(Model Context Protocol)](https://www.anthropic.com/news/model-context-protocol) server that accesses to [Lightdash](https://www.lightdash.com/).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--syucream--lightdash-mcp-server--lightdash-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LIGHTDASH_API_KEY=lightdash-api-key -e LIGHTDASH_API_URL=lightdash-api-url \
ghcr.io/metorial/mcp-container--syucream--lightdash-mcp-server--lightdash-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LIGHTDASH_API_KEY`
- `LIGHTDASH_API_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "lightdash-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--syucream--lightdash-mcp-server--lightdash-mcp-server",
        "npm run start"
      ],
      "env": {
        "LIGHTDASH_API_KEY": "lightdash-api-key",
        "LIGHTDASH_API_URL": "lightdash-api-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/syucream/lightdash-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  