
# Airbnb MCP Server

A containerized version of "Airbnb MCP Server"

> Repository: [openbnb-org/mcp-server-airbnb](https://github.com/openbnb-org/mcp-server-airbnb)

## Description

MCP Server for searching Airbnb and get listing details.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--openbnb-org--mcp-server-airbnb--mcp-server-airbnb
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--openbnb-org--mcp-server-airbnb--mcp-server-airbnb  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-airbnb": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--openbnb-org--mcp-server-airbnb--mcp-server-airbnb",
        "node dist/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/openbnb-org/mcp-server-airbnb) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  