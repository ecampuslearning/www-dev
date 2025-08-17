
# Web Search MCP Server

A containerized version of "Web Search MCP Server"

> Repository: [pskill9/web-search](https://github.com/pskill9/web-search)

## Description

A Model Context Protocol (MCP) server that enables free web searching using Google search results, with no API keys required.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--pskill9--web-search--web-search
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--pskill9--web-search--web-search  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "web-search": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--pskill9--web-search--web-search",
        "node ./build/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/pskill9/web-search) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  