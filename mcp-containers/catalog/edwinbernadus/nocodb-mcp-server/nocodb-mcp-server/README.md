
# Nocodb MCP Server

A containerized version of "Nocodb MCP Server"

> Repository: [edwinbernadus/nocodb-mcp-server](https://github.com/edwinbernadus/nocodb-mcp-server)

## Description

The Nocodb MCP Server enables seamless interaction with a Nocodb database using the Model Context Protocol (MCP). It facilitates CRUD (Create, Read, Update, Delete) operations on Nocodb tables.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--edwinbernadus--nocodb-mcp-server--nocodb-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NOCODB_URL=nocodb-url -e NOCODB_BASE_ID=nocodb-base-id -e NOCODB_API_TOKEN=nocodb-api-token \
ghcr.io/metorial/mcp-container--edwinbernadus--nocodb-mcp-server--nocodb-mcp-server  "node dist/start.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NOCODB_URL`
- `NOCODB_BASE_ID`
- `NOCODB_API_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "nocodb-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--edwinbernadus--nocodb-mcp-server--nocodb-mcp-server",
        "node dist/start.js"
      ],
      "env": {
        "NOCODB_URL": "nocodb-url",
        "NOCODB_BASE_ID": "nocodb-base-id",
        "NOCODB_API_TOKEN": "nocodb-api-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/edwinbernadus/nocodb-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  