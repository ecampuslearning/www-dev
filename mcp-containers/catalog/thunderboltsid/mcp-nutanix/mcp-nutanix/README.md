
# MCP Nutanix

A containerized version of "MCP Nutanix"

> Repository: [thunderboltsid/mcp-nutanix](https://github.com/thunderboltsid/mcp-nutanix)

## Description

A Model Context Protocol (MCP) server for interacting with Nutanix Prism Central APIs through Large Language Models (LLMs).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--thunderboltsid--mcp-nutanix--mcp-nutanix
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--thunderboltsid--mcp-nutanix--mcp-nutanix  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-nutanix": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--thunderboltsid--mcp-nutanix--mcp-nutanix",
        "./out"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/thunderboltsid/mcp-nutanix) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  