
# mcp-rquest

A containerized version of "mcp-rquest"

> Repository: [xxxbrian/mcp-rquest](https://github.com/xxxbrian/mcp-rquest)

## Description

A Model Context Protocol (MCP) server that provides advanced HTTP request capabilities for Claude and other LLMs. Built on [rquest](https://github.com/0x676e67/rquest), this server enables realistic browser emulation with accurate TLS/JA3/JA4 fingerprints, allowing models to interact with websites more naturally and bypass common anti-bot measures. It also supports converting PDF and HTML documents to Markdown for easier processing by LLMs.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--xxxbrian--mcp-rquest--mcp-rquest
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--xxxbrian--mcp-rquest--mcp-rquest  "mcp-rquest"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-rquest": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--xxxbrian--mcp-rquest--mcp-rquest",
        "mcp-rquest"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/xxxbrian/mcp-rquest) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  