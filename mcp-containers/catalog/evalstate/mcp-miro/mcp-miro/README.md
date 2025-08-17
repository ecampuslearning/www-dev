
# mcp-miro MCP Server

A containerized version of "mcp-miro MCP Server"

> Repository: [evalstate/mcp-miro](https://github.com/evalstate/mcp-miro)

## Description

A Model Context Protocol server to connect to the MIRO Whiteboard Application.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--evalstate--mcp-miro--mcp-miro
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--evalstate--mcp-miro--mcp-miro  "node ./build/index.js --token token"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--token`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-miro": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--evalstate--mcp-miro--mcp-miro",
        "node ./build/index.js --token token"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/evalstate/mcp-miro) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  