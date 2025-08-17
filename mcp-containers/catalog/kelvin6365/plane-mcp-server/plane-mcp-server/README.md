
# Plane MCP Server

A containerized version of "Plane MCP Server"

> Repository: [kelvin6365/plane-mcp-server](https://github.com/kelvin6365/plane-mcp-server)

## Description

A Model Context Protocol (MCP) server that enables LLMs to interact with [Plane.so](https://plane.so), allowing them to manage projects and issues through Plane's API. Using this server, LLMs like Claude can directly interact with your project management workflows while maintaining user control and security.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kelvin6365--plane-mcp-server--plane-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e PLANE_API_KEY=plane-api-key -e PLANE_WORKSPACE_SLUG=plane-workspace-slug \
ghcr.io/metorial/mcp-container--kelvin6365--plane-mcp-server--plane-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `PLANE_API_KEY`
- `PLANE_WORKSPACE_SLUG`




## Usage with Claude

```json
{
  "mcpServers": {
    "plane-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kelvin6365--plane-mcp-server--plane-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "PLANE_API_KEY": "plane-api-key",
        "PLANE_WORKSPACE_SLUG": "plane-workspace-slug"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kelvin6365/plane-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  