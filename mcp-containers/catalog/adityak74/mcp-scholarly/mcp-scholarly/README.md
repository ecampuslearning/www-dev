
# mcp-scholarly MCP server

A containerized version of "mcp-scholarly MCP server"

> Repository: [adityak74/mcp-scholarly](https://github.com/adityak74/mcp-scholarly)

## Description

A MCP server to search for accurate academic articles. More scholarly vendors will be added soon.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--adityak74--mcp-scholarly--mcp-scholarly
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--adityak74--mcp-scholarly--mcp-scholarly  "mcp-scholarly"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-scholarly": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--adityak74--mcp-scholarly--mcp-scholarly",
        "mcp-scholarly"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/adityak74/mcp-scholarly) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  