
# Unstructured API MCP Server

A containerized version of "Unstructured API MCP Server"

> Repository: [Unstructured-IO/UNS-MCP](https://github.com/Unstructured-IO/UNS-MCP)

## Description

An MCP server implementation for interacting with the Unstructured API. This server provides tools to list sources and workflows.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--unstructured-io--uns-mcp--uns-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e UNSTRUCTURED_API_KEY=unstructured-api-key \
ghcr.io/metorial/mcp-container--unstructured-io--uns-mcp--uns-mcp  "uns_mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `UNSTRUCTURED_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "uns-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--unstructured-io--uns-mcp--uns-mcp",
        "uns_mcp"
      ],
      "env": {
        "UNSTRUCTURED_API_KEY": "unstructured-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Unstructured-IO/UNS-MCP) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  