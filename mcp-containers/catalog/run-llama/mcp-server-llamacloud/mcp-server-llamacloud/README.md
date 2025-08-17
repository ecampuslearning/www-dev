
# LlamaCloud MCP Server

A containerized version of "LlamaCloud MCP Server"

> Repository: [run-llama/mcp-server-llamacloud](https://github.com/run-llama/mcp-server-llamacloud)

## Description

A MCP server connecting to multiple managed indexes on [LlamaCloud](https://cloud.llamaindex.ai/)


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--run-llama--mcp-server-llamacloud--mcp-server-llamacloud
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LLAMA_CLOUD_PROJECT_NAME=llama-cloud-project-name -e LLAMA_CLOUD_API_KEY=llama-cloud-api-key \
ghcr.io/metorial/mcp-container--run-llama--mcp-server-llamacloud--mcp-server-llamacloud  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LLAMA_CLOUD_PROJECT_NAME`
- `LLAMA_CLOUD_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-llamacloud": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--run-llama--mcp-server-llamacloud--mcp-server-llamacloud",
        "node ./build/index.js"
      ],
      "env": {
        "LLAMA_CLOUD_PROJECT_NAME": "llama-cloud-project-name",
        "LLAMA_CLOUD_API_KEY": "llama-cloud-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/run-llama/mcp-server-llamacloud) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  