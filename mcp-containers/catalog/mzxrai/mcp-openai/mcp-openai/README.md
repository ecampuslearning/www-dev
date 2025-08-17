
# MCP OpenAI Server

A containerized version of "MCP OpenAI Server"

> Repository: [mzxrai/mcp-openai](https://github.com/mzxrai/mcp-openai)

## Description

A Model Context Protocol (MCP) server that lets you seamlessly use OpenAI's models right from Claude.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--mzxrai--mcp-openai--mcp-openai
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OPENAI_API_KEY=openai-api-key \
ghcr.io/metorial/mcp-container--mzxrai--mcp-openai--mcp-openai  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `OPENAI_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-openai": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--mzxrai--mcp-openai--mcp-openai",
        "node dist/index.js"
      ],
      "env": {
        "OPENAI_API_KEY": "openai-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/mzxrai/mcp-openai) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  