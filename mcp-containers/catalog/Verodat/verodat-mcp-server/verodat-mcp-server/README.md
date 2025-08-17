
# Verodat MCP Server

A containerized version of "Verodat MCP Server"

> Repository: [Verodat/verodat-mcp-server](https://github.com/Verodat/verodat-mcp-server)

## Description

Verodat MCP Server Implementation


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--verodat--verodat-mcp-server--verodat-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e VERODAT_AI_API_KEY=verodat-ai-api-key -e VERODAT_API_BASE_URL=verodat-api-base-url \
ghcr.io/metorial/mcp-container--verodat--verodat-mcp-server--verodat-mcp-server  "node ./build/src/consume.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `VERODAT_AI_API_KEY`
- `VERODAT_API_BASE_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "verodat-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--verodat--verodat-mcp-server--verodat-mcp-server",
        "node ./build/src/consume.js"
      ],
      "env": {
        "VERODAT_AI_API_KEY": "verodat-ai-api-key",
        "VERODAT_API_BASE_URL": "verodat-api-base-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Verodat/verodat-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  