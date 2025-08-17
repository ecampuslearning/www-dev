
# Jira MCP

A containerized version of "Jira MCP"

> Repository: [nguyenvanduocit/jira-mcp](https://github.com/nguyenvanduocit/jira-mcp)

## Description

A Go-based MCP (Model Control Protocol) connector for Jira that enables AI assistants like Claude to interact with Atlassian Jira. This tool provides a seamless interface for AI models to perform common Jira operations.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--nguyenvanduocit--jira-mcp--jira-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ATLASSIAN_HOST=atlassian-host -e ATLASSIAN_EMAIL=atlassian-email -e ATLASSIAN_TOKEN=atlassian-token \
ghcr.io/metorial/mcp-container--nguyenvanduocit--jira-mcp--jira-mcp  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ATLASSIAN_HOST`
- `ATLASSIAN_EMAIL`
- `ATLASSIAN_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "jira-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--nguyenvanduocit--jira-mcp--jira-mcp",
        "./out"
      ],
      "env": {
        "ATLASSIAN_HOST": "atlassian-host",
        "ATLASSIAN_EMAIL": "atlassian-email",
        "ATLASSIAN_TOKEN": "atlassian-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/nguyenvanduocit/jira-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  