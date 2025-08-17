
# MCP Text Editor Server

A containerized version of "MCP Text Editor Server"

> Repository: [tumf/mcp-text-editor](https://github.com/tumf/mcp-text-editor)

## Description

A Model Context Protocol (MCP) server that provides line-oriented text file editing capabilities through a standardized API. Optimized for LLM tools with efficient partial file access to minimize token usage.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--tumf--mcp-text-editor--mcp-text-editor
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--tumf--mcp-text-editor--mcp-text-editor  "mcp-text-editor"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-text-editor": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--tumf--mcp-text-editor--mcp-text-editor",
        "mcp-text-editor"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/tumf/mcp-text-editor) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  