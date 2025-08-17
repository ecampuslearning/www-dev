
# MCP Atlassian

A containerized version of "MCP Atlassian"

> Repository: [sooperset/mcp-atlassian](https://github.com/sooperset/mcp-atlassian)

## Description

Model Context Protocol (MCP) server for Atlassian products (Confluence and Jira). This integration supports both Confluence & Jira Cloud and Server/Data Center deployments.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--sooperset--mcp-atlassian--mcp-atlassian
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--sooperset--mcp-atlassian--mcp-atlassian  "mcp-atlassian --confluence-url confluence-url --confluence-username confluence-username --confluence-token confluence-token --jira-url jira-url --jira-username jira-username --jira-token jira-token"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--confluence-url`
- `--confluence-username`
- `--confluence-token`
- `--jira-url`
- `--jira-username`
- `--jira-token`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-atlassian": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--sooperset--mcp-atlassian--mcp-atlassian",
        "mcp-atlassian --confluence-url confluence-url --confluence-username confluence-username --confluence-token confluence-token --jira-url jira-url --jira-username jira-username --jira-token jira-token"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/sooperset/mcp-atlassian) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  