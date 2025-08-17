
# EduBase MCP server

A containerized version of "EduBase MCP server"

> Repository: [EduBase/MCP](https://github.com/EduBase/MCP)

## Description

Model Context Protocol server **for the EduBase platform**. It allows MCP clients (for example Claude Desktop) and LLMs to interact with your EduBase account and perform tasks on your behalf.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--edubase--mcp--mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e EDUBASE_API_URL=edubase-api-url -e EDUBASE_API_APP=edubase-api-app -e EDUBASE_API_KEY=edubase-api-key \
ghcr.io/metorial/mcp-container--edubase--mcp--mcp  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `EDUBASE_API_URL`
- `EDUBASE_API_APP`
- `EDUBASE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--edubase--mcp--mcp",
        "node dist/index.js"
      ],
      "env": {
        "EDUBASE_API_URL": "edubase-api-url",
        "EDUBASE_API_APP": "edubase-api-app",
        "EDUBASE_API_KEY": "edubase-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/EduBase/MCP) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  