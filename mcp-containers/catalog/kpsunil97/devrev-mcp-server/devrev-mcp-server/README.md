
# DevRev MCP server

A containerized version of "DevRev MCP server"

> Repository: [kpsunil97/devrev-mcp-server](https://github.com/kpsunil97/devrev-mcp-server)

## Description

A Model Context Protocol server for DevRev. It is used to search and retrieve information using the DevRev APIs.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kpsunil97--devrev-mcp-server--devrev-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DEVREV_API_KEY=devrev-api-key \
ghcr.io/metorial/mcp-container--kpsunil97--devrev-mcp-server--devrev-mcp-server  "devrev-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DEVREV_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "devrev-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kpsunil97--devrev-mcp-server--devrev-mcp-server",
        "devrev-mcp"
      ],
      "env": {
        "DEVREV_API_KEY": "devrev-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kpsunil97/devrev-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  