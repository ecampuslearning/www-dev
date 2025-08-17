
# duckduckgo-search MCP Server

A containerized version of "duckduckgo-search MCP Server"

> Repository: [zhsama/duckduckgo-mpc-server](https://github.com/zhsama/duckduckgo-mpc-server/)

## Description

A Model Context Protocol server for DuckDuckGo Search


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--zhsama--duckduckgo-mpc-server--duckduckgo-mpc-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--zhsama--duckduckgo-mpc-server--duckduckgo-mpc-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "duckduckgo-mpc-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--zhsama--duckduckgo-mpc-server--duckduckgo-mpc-server",
        "node ./build/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/zhsama/duckduckgo-mpc-server/) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  