
# any-chat-completions-mcp MCP Server

A containerized version of "any-chat-completions-mcp MCP Server"

> Repository: [pyroprompts/any-chat-completions-mcp](https://github.com/pyroprompts/any-chat-completions-mcp)

## Description

Integrate Claude with Any OpenAI SDK Compatible Chat Completion API - OpenAI, Perplexity, Groq, xAI, PyroPrompts and more.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--pyroprompts--any-chat-completions-mcp--any-chat-completions-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AI_CHAT_KEY=ai-chat-key -e AI_CHAT_NAME=ai-chat-name -e AI_CHAT_MODEL=ai-chat-model -e AI_CHAT_BASE_URL=ai-chat-base-url \
ghcr.io/metorial/mcp-container--pyroprompts--any-chat-completions-mcp--any-chat-completions-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AI_CHAT_KEY`
- `AI_CHAT_NAME`
- `AI_CHAT_MODEL`
- `AI_CHAT_BASE_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "any-chat-completions-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--pyroprompts--any-chat-completions-mcp--any-chat-completions-mcp",
        "npm run start"
      ],
      "env": {
        "AI_CHAT_KEY": "ai-chat-key",
        "AI_CHAT_NAME": "ai-chat-name",
        "AI_CHAT_MODEL": "ai-chat-model",
        "AI_CHAT_BASE_URL": "ai-chat-base-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/pyroprompts/any-chat-completions-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  