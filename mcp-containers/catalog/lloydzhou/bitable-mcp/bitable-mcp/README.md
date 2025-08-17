
# Bitable MCP Server

A containerized version of "Bitable MCP Server"

> Repository: [lloydzhou/bitable-mcp](https://github.com/lloydzhou/bitable-mcp)

## Description

This MCP server provides access to Lark Bitable through the Model Context Protocol. It allows users to interact with Bitable tables using predefined tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--lloydzhou--bitable-mcp--bitable-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e PERSONAL_BASE_TOKEN=personal-base-token -e APP_TOKEN=app-token \
ghcr.io/metorial/mcp-container--lloydzhou--bitable-mcp--bitable-mcp  "bitable-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `PERSONAL_BASE_TOKEN`
- `APP_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "bitable-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--lloydzhou--bitable-mcp--bitable-mcp",
        "bitable-mcp"
      ],
      "env": {
        "PERSONAL_BASE_TOKEN": "personal-base-token",
        "APP_TOKEN": "app-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/lloydzhou/bitable-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  