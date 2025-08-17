
# Tinybird MCP server

A containerized version of "Tinybird MCP server"

> Repository: [tinybirdco/mcp-tinybird](https://github.com/tinybirdco/mcp-tinybird)

## Description

An MCP server to interact with a Tinybird Workspace from any MCP client.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--tinybirdco--mcp-tinybird--mcp-tinybird
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TB_API_URL=tb-api-url -e TB_ADMIN_TOKEN=tb-admin-token \
ghcr.io/metorial/mcp-container--tinybirdco--mcp-tinybird--mcp-tinybird stdio "mcp-tinybird stdio"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TB_API_URL`
- `TB_ADMIN_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-tinybird": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--tinybirdco--mcp-tinybird--mcp-tinybird",
        "mcp-tinybird stdio"
      ],
      "env": {
        "TB_API_URL": "tb-api-url",
        "TB_ADMIN_TOKEN": "tb-admin-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/tinybirdco/mcp-tinybird) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  