
# Flipt MCP Server

A containerized version of "Flipt MCP Server"

> Repository: [flipt-io/mcp-server-flipt](https://github.com/flipt-io/mcp-server-flipt)

## Description

A [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) server for [Flipt](https://flipt.io), allowing AI assistants to interact with feature flags.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--flipt-io--mcp-server-flipt--mcp-server-flipt
```

2. Run the container:

```bash
docker run -i --rm \ 
-e FLIPT_API_URL=flipt-api-url -e FLIPT_API_KEY=flipt-api-key \
ghcr.io/metorial/mcp-container--flipt-io--mcp-server-flipt--mcp-server-flipt  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `FLIPT_API_URL`
- `FLIPT_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-flipt": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--flipt-io--mcp-server-flipt--mcp-server-flipt",
        "npm run start"
      ],
      "env": {
        "FLIPT_API_URL": "flipt-api-url",
        "FLIPT_API_KEY": "flipt-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/flipt-io/mcp-server-flipt) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  