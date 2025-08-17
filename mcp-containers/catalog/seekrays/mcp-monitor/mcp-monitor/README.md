
# MCP System Monitor

A containerized version of "MCP System Monitor"

> Repository: [seekrays/mcp-monitor](https://github.com/seekrays/mcp-monitor)

## Description

A system monitoring tool that exposes system metrics via the Model Context Protocol (MCP). This tool allows LLMs to retrieve real-time system information through an MCP-compatible interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--seekrays--mcp-monitor--mcp-monitor
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--seekrays--mcp-monitor--mcp-monitor  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-monitor": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--seekrays--mcp-monitor--mcp-monitor",
        "./out"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/seekrays/mcp-monitor) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  