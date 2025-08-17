
# Hacker News MCP Server

A containerized version of "Hacker News MCP Server"

> Repository: [erithwik/mcp-hn](https://github.com/erithwik/mcp-hn)

## Description

A Model Context Protocol (MCP) server that provides tools for fetching information from Hacker News.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--erithwik--mcp-hn--mcp-hn
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--erithwik--mcp-hn--mcp-hn  "mcp-hn"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-hn": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--erithwik--mcp-hn--mcp-hn",
        "mcp-hn"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/erithwik/mcp-hn) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  