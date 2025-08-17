
# Chroma MCP Server

A containerized version of "Chroma MCP Server"

> Repository: [privetin/chroma](https://github.com/privetin/chroma)

## Description

A Model Context Protocol (MCP) server implementation that provides vector database capabilities through Chroma. This server enables semantic document search, metadata filtering, and document management with persistent storage.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--privetin--chroma--chroma
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--privetin--chroma--chroma  "chroma"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "chroma": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--privetin--chroma--chroma",
        "chroma"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/privetin/chroma) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  