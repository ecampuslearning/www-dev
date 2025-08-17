
# Mattermost MCP Host

A containerized version of "Mattermost MCP Host"

> Repository: [jagan-shanmugam/mattermost-mcp-host](https://github.com/jagan-shanmugam/mattermost-mcp-host)

## Description

A Mattermost integration that connects to Model Context Protocol (MCP) servers, leveraging a LangGraph-based AI agent to provide an intelligent interface for interacting with users and executing tools directly within Mattermost.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--jagan-shanmugam--mattermost-mcp-host--mattermost-mcp-host
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MATTERMOST_URL=mattermost-url -e MATTERMOST_TOKEN=mattermost-token -e MATTERMOST_TEAM_NAME=mattermost-team-name -e MATTERMOST_CHANNEL_NAME=mattermost-channel-name -e MATTERMOST_CHANNEL_ID=mattermost-channel-id -e DEFAULT_PROVIDER=default-provider -e AZURE_OPENAI_ENDPOINT=azure-openai-endpoint -e AZURE_OPENAI_API_KEY=azure-openai-api-key -e OPENAI_API_KEY=azure-openai-api-key -e AZURE_OPENAI_DEPLOYMENT=azure-openai-deployment -e AZURE_OPENAI_API_VERSION=azure-openai-api-version -e ANTHROPIC_API_KEY=anthropic-api-key -e GOOGLE_API_KEY=google-api-key -e COMMAND_PREFIX=command-prefix -e TAVILY_API_KEY=tavily-api-key \
ghcr.io/metorial/mcp-container--jagan-shanmugam--mattermost-mcp-host--mattermost-mcp-host  "mattermost-mcp-host --dev dev --all-extras all-extras"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--dev`
- `--all-extras`



#### Environment Variables

- `MATTERMOST_URL`
- `MATTERMOST_TOKEN`
- `MATTERMOST_TEAM_NAME`
- `MATTERMOST_CHANNEL_NAME`
- `MATTERMOST_CHANNEL_ID`
- `DEFAULT_PROVIDER`
- `AZURE_OPENAI_ENDPOINT`
- `AZURE_OPENAI_API_KEY`
- `OPENAI_API_KEY`
- `AZURE_OPENAI_DEPLOYMENT`
- `AZURE_OPENAI_API_VERSION`
- `ANTHROPIC_API_KEY`
- `GOOGLE_API_KEY`
- `COMMAND_PREFIX`
- `TAVILY_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mattermost-mcp-host": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--jagan-shanmugam--mattermost-mcp-host--mattermost-mcp-host",
        "mattermost-mcp-host --dev dev --all-extras all-extras"
      ],
      "env": {
        "MATTERMOST_URL": "mattermost-url",
        "MATTERMOST_TOKEN": "mattermost-token",
        "MATTERMOST_TEAM_NAME": "mattermost-team-name",
        "MATTERMOST_CHANNEL_NAME": "mattermost-channel-name",
        "MATTERMOST_CHANNEL_ID": "mattermost-channel-id",
        "DEFAULT_PROVIDER": "default-provider",
        "AZURE_OPENAI_ENDPOINT": "azure-openai-endpoint",
        "AZURE_OPENAI_API_KEY": "azure-openai-api-key",
        "OPENAI_API_KEY": "azure-openai-api-key",
        "AZURE_OPENAI_DEPLOYMENT": "azure-openai-deployment",
        "AZURE_OPENAI_API_VERSION": "azure-openai-api-version",
        "ANTHROPIC_API_KEY": "anthropic-api-key",
        "GOOGLE_API_KEY": "google-api-key",
        "COMMAND_PREFIX": "command-prefix",
        "TAVILY_API_KEY": "tavily-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/jagan-shanmugam/mattermost-mcp-host) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  