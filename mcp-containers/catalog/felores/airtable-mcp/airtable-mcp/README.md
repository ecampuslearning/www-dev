
# Airtable MCP Server

A containerized version of "Airtable MCP Server"

> Repository: [felores/airtable-mcp](https://github.com/felores/airtable-mcp)

## Description

A Model Context Protocol server that provides tools for interacting with Airtable's API. This server enables programmatic management of Airtable bases, tables, fields, and records through Claude Desktop or other MCP clients.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--felores--airtable-mcp--airtable-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AIRTABLE_API_KEY=airtable-api-key \
ghcr.io/metorial/mcp-container--felores--airtable-mcp--airtable-mcp  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AIRTABLE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "airtable-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--felores--airtable-mcp--airtable-mcp",
        "node build/index.js"
      ],
      "env": {
        "AIRTABLE_API_KEY": "airtable-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/felores/airtable-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  