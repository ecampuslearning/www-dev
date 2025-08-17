
# Unichat MCP Server in Python

A containerized version of "Unichat MCP Server in Python"

> Repository: [amidabuddha/unichat-mcp-server](https://github.com/amidabuddha/unichat-mcp-server)

## Description

ASend requests to OpenAI, MistralAI, Anthropic, xAI, Google AI, DeepSeek, Alibaba, Inception using MCP protocol via tool or predefined prompts.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--amidabuddha--unichat-mcp-server--unichat-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e UNICHAT_MODEL=unichat-model -e UNICHAT_API_KEY=unichat-api-key \
ghcr.io/metorial/mcp-container--amidabuddha--unichat-mcp-server--unichat-mcp-server  "unichat-mcp-server"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `UNICHAT_MODEL`
- `UNICHAT_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "unichat-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--amidabuddha--unichat-mcp-server--unichat-mcp-server",
        "unichat-mcp-server"
      ],
      "env": {
        "UNICHAT_MODEL": "unichat-model",
        "UNICHAT_API_KEY": "unichat-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/amidabuddha/unichat-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  