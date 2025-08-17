
# Slack MCP Server

A containerized version of "Slack MCP Server"

> Repository: [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers)

## Description

MCP Server for the Slack API, enabling Claude to interact with Slack workspaces.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--slack
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SLACK_BOT_TOKEN=slack-bot-token -e SLACK_TEAM_ID=slack-team-id \
ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--slack  "cd ./src/slack && node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SLACK_BOT_TOKEN`
- `SLACK_TEAM_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "slack": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--slack",
        "cd ./src/slack && node ./dist/index.js"
      ],
      "env": {
        "SLACK_BOT_TOKEN": "slack-bot-token",
        "SLACK_TEAM_ID": "slack-team-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/modelcontextprotocol/servers) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  