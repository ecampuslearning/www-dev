
# G-Search MCP

A containerized version of "G-Search MCP"

> Repository: [jae-jae/g-search-mcp](https://github.com/jae-jae/g-search-mcp)

## Description

A powerful MCP server for Google search that enables parallel searching with multiple keywords simultaneously.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jae-jae--g-search-mcp--g-search-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--jae-jae--g-search-mcp--g-search-mcp  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "g-search-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jae-jae--g-search-mcp--g-search-mcp",
        "node build/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/jae-jae/g-search-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  