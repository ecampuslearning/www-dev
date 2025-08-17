
# 🏆 Audiense Insights MCP Server

A containerized version of "🏆 Audiense Insights MCP Server"

> Repository: [AudienseCo/mcp-audiense-insights](https://github.com/AudienseCo/mcp-audiense-insights)

## Description

This server, based on the [Model Context Protocol (MCP)](https://github.com/modelcontextprotocol), allows **Claude** or any other MCP-compatible client to interact with your [Audiense Insights](https://www.audiense.com/) account. It extracts **marketing insights and audience analysis** from Audiense reports, covering **demographic, cultural, influencer, and content engagement analysis**.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--audienseco--mcp-audiense-insights--mcp-audiense-insights
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AUDIENSE_CLIENT_ID=audiense-client-id -e AUDIENSE_CLIENT_SECRET=audiense-client-secret -e TWITTER_BEARER_TOKEN=twitter-bearer-token \
ghcr.io/metorial/mcp-container--audienseco--mcp-audiense-insights--mcp-audiense-insights  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AUDIENSE_CLIENT_ID`
- `AUDIENSE_CLIENT_SECRET`
- `TWITTER_BEARER_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-audiense-insights": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--audienseco--mcp-audiense-insights--mcp-audiense-insights",
        "node ./build/index.js"
      ],
      "env": {
        "AUDIENSE_CLIENT_ID": "audiense-client-id",
        "AUDIENSE_CLIENT_SECRET": "audiense-client-secret",
        "TWITTER_BEARER_TOKEN": "twitter-bearer-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/AudienseCo/mcp-audiense-insights) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  