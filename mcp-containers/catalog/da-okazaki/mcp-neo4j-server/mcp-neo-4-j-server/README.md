
# MCP Neo4j Server

A containerized version of "MCP Neo4j Server"

> Repository: [da-okazaki/mcp-neo4j-server](https://github.com/da-okazaki/mcp-neo4j-server)

## Description

An MCP server that provides integration between Neo4j graph database and Claude Desktop, enabling graph database operations through natural language interactions.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--da-okazaki--mcp-neo4j-server--mcp-neo-4-j-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NEO4J_URI=neo-4-j-uri -e NEO4J_USERNAME=neo-4-j-username -e NEO4J_PASSWORD=neo-4-j-password \
ghcr.io/metorial/mcp-container--da-okazaki--mcp-neo4j-server--mcp-neo-4-j-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `NEO4J_URI`
- `NEO4J_USERNAME`
- `NEO4J_PASSWORD`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-neo-4-j-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--da-okazaki--mcp-neo4j-server--mcp-neo-4-j-server",
        "node ./build/index.js"
      ],
      "env": {
        "NEO4J_URI": "neo-4-j-uri",
        "NEO4J_USERNAME": "neo-4-j-username",
        "NEO4J_PASSWORD": "neo-4-j-password"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/da-okazaki/mcp-neo4j-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  