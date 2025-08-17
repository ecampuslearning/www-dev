
# File Merger MCP Server

A containerized version of "File Merger MCP Server"

> Repository: [exoticknight/mcp-file-merger](https://github.com/exoticknight/mcp-file-merger)

## Description

Simple utility to combine multiple files into one. Fast, secure, and easy to use.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--exoticknight--mcp-file-merger--mcp-file-merger
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--exoticknight--mcp-file-merger--mcp-file-merger {{DIR}} "node dist/index.js {{DIR}}"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `{{DIR}}`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-file-merger": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--exoticknight--mcp-file-merger--mcp-file-merger",
        "node dist/index.js {{DIR}}"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/exoticknight/mcp-file-merger) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  