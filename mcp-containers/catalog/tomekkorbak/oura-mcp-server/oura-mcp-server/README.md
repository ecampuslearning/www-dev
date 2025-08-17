
# Oura MCP Server

A containerized version of "Oura MCP Server"

> Repository: [tomekkorbak/oura-mcp-server](https://github.com/tomekkorbak/oura-mcp-server)

## Description

A [Model Context Protocol](https://modelcontextprotocol.io/introduction) (MCP) server that provides access to the Oura API. It allows language models to query sleep, readiness, and resilience data from Oura API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--tomekkorbak--oura-mcp-server--oura-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OURA_API_TOKEN=oura-api-token \
ghcr.io/metorial/mcp-container--tomekkorbak--oura-mcp-server--oura-mcp-server  "oura-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OURA_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "oura-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--tomekkorbak--oura-mcp-server--oura-mcp-server",
        "oura-mcp-server"
      ],
      "env": {
        "OURA_API_TOKEN": "oura-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/tomekkorbak/oura-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  