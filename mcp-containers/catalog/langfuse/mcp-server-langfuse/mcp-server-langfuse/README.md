
# Langfuse Prompt Management MCP Server

A containerized version of "Langfuse Prompt Management MCP Server"

> Repository: [langfuse/mcp-server-langfuse](https://github.com/langfuse/mcp-server-langfuse)

## Description

Model Context Protocol (MCP) Server for Langfuse Prompt Management. This server allows you to access and manage your Langfuse prompts through the Model Context Protocol.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--langfuse--mcp-server-langfuse--mcp-server-langfuse
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LANGFUSE_PUBLIC_KEY=langfuse-public-key -e LANGFUSE_SECRET_KEY=langfuse-secret-key -e LANGFUSE_BASEURL=langfuse-baseurl \
ghcr.io/metorial/mcp-container--langfuse--mcp-server-langfuse--mcp-server-langfuse  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LANGFUSE_PUBLIC_KEY`
- `LANGFUSE_SECRET_KEY`
- `LANGFUSE_BASEURL`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-langfuse": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--langfuse--mcp-server-langfuse--mcp-server-langfuse",
        "node ./build/index.js"
      ],
      "env": {
        "LANGFUSE_PUBLIC_KEY": "langfuse-public-key",
        "LANGFUSE_SECRET_KEY": "langfuse-secret-key",
        "LANGFUSE_BASEURL": "langfuse-baseurl"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/langfuse/mcp-server-langfuse) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  