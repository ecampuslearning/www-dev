
# NASA MCP Server

A containerized version of "NASA MCP Server"

> Repository: [ProgramComputer/NASA-MCP-server](https://github.com/ProgramComputer/NASA-MCP-server)

## Description

A Model Context Protocol (MCP) server for NASA APIs, providing a standardized interface for AI models to interact with NASA's vast array of data sources. This server implements the official Model Context Protocol specification.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--programcomputer--nasa-mcp-server--nasa-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NASA_API_KEY=nasa-api-key \
ghcr.io/metorial/mcp-container--programcomputer--nasa-mcp-server--nasa-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NASA_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "nasa-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--programcomputer--nasa-mcp-server--nasa-mcp-server",
        "npm run start"
      ],
      "env": {
        "NASA_API_KEY": "nasa-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ProgramComputer/NASA-MCP-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  