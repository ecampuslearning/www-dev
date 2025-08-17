
# MCP Server for ArangoDB

A containerized version of "MCP Server for ArangoDB"

> Repository: [ravenwits/mcp-server-arangodb](https://github.com/ravenwits/mcp-server-arangodb)

## Description

A Model Context Protocol server for ArangoDB


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ravenwits--mcp-server-arangodb--mcp-server-arangodb
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ARANGO_URL=arango-url -e ARANGO_DB=arango-db -e ARANGO_USERNAME=arango-username -e ARANGO_PASSWORD=arango-password \
ghcr.io/metorial/mcp-container--ravenwits--mcp-server-arangodb--mcp-server-arangodb  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ARANGO_URL`
- `ARANGO_DB`
- `ARANGO_USERNAME`
- `ARANGO_PASSWORD`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-arangodb": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ravenwits--mcp-server-arangodb--mcp-server-arangodb",
        "npm run start"
      ],
      "env": {
        "ARANGO_URL": "arango-url",
        "ARANGO_DB": "arango-db",
        "ARANGO_USERNAME": "arango-username",
        "ARANGO_PASSWORD": "arango-password"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ravenwits/mcp-server-arangodb) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  