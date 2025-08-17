
# MCP Server for Ticketmaster

A containerized version of "MCP Server for Ticketmaster"

> Repository: [delorenj/mcp-server-ticketmaster](https://github.com/delorenj/mcp-server-ticketmaster)

## Description

A Model Context Protocol server that provides tools for discovering events, venues, and attractions through the Ticketmaster Discovery API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--delorenj--mcp-server-ticketmaster--mcp-server-ticketmaster
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TICKETMASTER_API_KEY=ticketmaster-api-key \
ghcr.io/metorial/mcp-container--delorenj--mcp-server-ticketmaster--mcp-server-ticketmaster  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TICKETMASTER_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-ticketmaster": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--delorenj--mcp-server-ticketmaster--mcp-server-ticketmaster",
        "node ./build/index.js"
      ],
      "env": {
        "TICKETMASTER_API_KEY": "ticketmaster-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/delorenj/mcp-server-ticketmaster) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  