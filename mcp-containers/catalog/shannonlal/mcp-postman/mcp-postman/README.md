
# Postman MCP Server

A containerized version of "Postman MCP Server"

> Repository: [shannonlal/mcp-postman](https://github.com/shannonlal/mcp-postman)

## Description

An MCP (Model Context Protocol) server that enables running Postman collections using Newman. This server allows LLMs to execute API tests and get detailed results through a standardized interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--shannonlal--mcp-postman--mcp-postman
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--shannonlal--mcp-postman--mcp-postman  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-postman": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--shannonlal--mcp-postman--mcp-postman",
        "node ./build/index.js"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/shannonlal/mcp-postman) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  