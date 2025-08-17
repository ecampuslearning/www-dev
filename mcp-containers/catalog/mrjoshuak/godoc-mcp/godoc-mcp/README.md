
# godoc-mcp

A containerized version of "godoc-mcp"

> Repository: [mrjoshuak/godoc-mcp](https://github.com/mrjoshuak/godoc-mcp)

## Description

godoc-mcp is a Model Context Protocol (MCP) server that provides efficient access to Go documentation.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--mrjoshuak--godoc-mcp--godoc-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--mrjoshuak--godoc-mcp--godoc-mcp  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "godoc-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--mrjoshuak--godoc-mcp--godoc-mcp",
        "./out"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/mrjoshuak/godoc-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  