
# AI Agent Marketplace Index Search MCP Server

A containerized version of "AI Agent Marketplace Index Search MCP Server"

> Repository: [AI-Agent-Hub/ai-agent-marketplace-index-mcp](https://github.com/AI-Agent-Hub/ai-agent-marketplace-index-mcp)

## Description

MCP Server for AI Agent Marketplace Index from DeepNLP, , allowing AI assistants to searches available AI agents Navigation Page function, tools or use cases by "keywords" or "category". such as find all the "AI coding agents", "GUI AI Agents", "Mobile Use Agent", "Desktop Use Agent", etc.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ai-agent-hub--ai-agent-marketplace-index-mcp--ai-agent-marketplace-index-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--ai-agent-hub--ai-agent-marketplace-index-mcp--ai-agent-marketplace-index-mcp  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "ai-agent-marketplace-index-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ai-agent-hub--ai-agent-marketplace-index-mcp--ai-agent-marketplace-index-mcp",
        "python main.py"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/AI-Agent-Hub/ai-agent-marketplace-index-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  