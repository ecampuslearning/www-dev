
# Postman MCP Server

A containerized version of "Postman MCP Server"

> Repository: [delano/postman-mcp-server](https://github.com/delano/postman-mcp-server)

## Description

An MCP server that provides access to Postman.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--delano--postman-mcp-server--postman-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e POSTMAN_API_KEY=postman-api-key \
ghcr.io/metorial/mcp-container--delano--postman-mcp-server--postman-mcp-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `POSTMAN_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "postman-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--delano--postman-mcp-server--postman-mcp-server",
        "node ./build/index.js"
      ],
      "env": {
        "POSTMAN_API_KEY": "postman-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/delano/postman-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  