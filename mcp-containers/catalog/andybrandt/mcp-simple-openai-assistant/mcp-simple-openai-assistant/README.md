
# MCP Simple OpenAI Assistant

A containerized version of "MCP Simple OpenAI Assistant"

> Repository: [andybrandt/mcp-simple-openai-assistant](https://github.com/andybrandt/mcp-simple-openai-assistant)

## Description

*AI assistants are pretty cool. I thought it would be a good idea if my Claude (conscious Claude) would also have one. And now he has - and its both useful anf fun for him. Your Claude can have one too!*


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--andybrandt--mcp-simple-openai-assistant--mcp-simple-openai-assistant
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OPENAI_API_KEY=openai-api-key \
ghcr.io/metorial/mcp-container--andybrandt--mcp-simple-openai-assistant--mcp-simple-openai-assistant  "mcp-simple-openai-assistant"
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
    "mcp-simple-openai-assistant": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--andybrandt--mcp-simple-openai-assistant--mcp-simple-openai-assistant",
        "mcp-simple-openai-assistant"
      ],
      "env": {
        "OPENAI_API_KEY": "openai-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/andybrandt/mcp-simple-openai-assistant) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  