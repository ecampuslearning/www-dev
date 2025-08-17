
# Make MCP Server

A containerized version of "Make MCP Server"

> Repository: [integromat/make-mcp-server](https://github.com/integromat/make-mcp-server)

## Description

A Model Context Protocol server that enables Make scenarios to be utilized as tools by AI assistants. This integration allows AI systems to trigger and interact with your Make automation workflows.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--integromat--make-mcp-server--make-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MAKE_API_KEY=make-api-key -e MAKE_ZONE=make-zone -e MAKE_TEAM=make-team \
ghcr.io/metorial/mcp-container--integromat--make-mcp-server--make-mcp-server  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MAKE_API_KEY`
- `MAKE_ZONE`
- `MAKE_TEAM`




## Usage with Claude

```json
{
  "mcpServers": {
    "make-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--integromat--make-mcp-server--make-mcp-server",
        "node build/index.js"
      ],
      "env": {
        "MAKE_API_KEY": "make-api-key",
        "MAKE_ZONE": "make-zone",
        "MAKE_TEAM": "make-team"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/integromat/make-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  