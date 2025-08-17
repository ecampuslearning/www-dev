
# Box MCP Server

A containerized version of "Box MCP Server"

> Repository: [hmk/box-mcp-server](https://github.com/hmk/box-mcp-server)

## Description

A Box model context protocol server to search, read and access files


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hmk--box-mcp-server--box-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e BOX_JWT_BASE64=box-jwt-base-64 -e BOX_USER_ID=box-user-id \
ghcr.io/metorial/mcp-container--hmk--box-mcp-server--box-mcp-server  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `BOX_JWT_BASE64`
- `BOX_USER_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "box-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hmk--box-mcp-server--box-mcp-server",
        "node dist/index.js"
      ],
      "env": {
        "BOX_JWT_BASE64": "box-jwt-base-64",
        "BOX_USER_ID": "box-user-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hmk/box-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  