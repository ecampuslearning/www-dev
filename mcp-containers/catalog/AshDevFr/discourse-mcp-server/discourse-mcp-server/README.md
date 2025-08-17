
# Discourse MCP Server

A containerized version of "Discourse MCP Server"

> Repository: [AshDevFr/discourse-mcp-server](https://github.com/AshDevFr/discourse-mcp-server)

## Description

Node.js server implementing Model Context Protocol (MCP) for Discourse search operation.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ashdevfr--discourse-mcp-server--discourse-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DISCOURSE_API_URL=discourse-api-url -e DISCOURSE_API_KEY=discourse-api-key -e DISCOURSE_API_USERNAME=discourse-api-username \
ghcr.io/metorial/mcp-container--ashdevfr--discourse-mcp-server--discourse-mcp-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DISCOURSE_API_URL`
- `DISCOURSE_API_KEY`
- `DISCOURSE_API_USERNAME`




## Usage with Claude

```json
{
  "mcpServers": {
    "discourse-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ashdevfr--discourse-mcp-server--discourse-mcp-server",
        "node ./build/index.js"
      ],
      "env": {
        "DISCOURSE_API_URL": "discourse-api-url",
        "DISCOURSE_API_KEY": "discourse-api-key",
        "DISCOURSE_API_USERNAME": "discourse-api-username"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/AshDevFr/discourse-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  