
# GitLab MR MCP

A containerized version of "GitLab MR MCP"

> Repository: [kopfrechner/gitlab-mr-mcp](https://github.com/kopfrechner/gitlab-mr-mcp)

## Description

A Model Context Protocol (MCP) server for interacting with GitLab merge requests and issues.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kopfrechner--gitlab-mr-mcp--gitlab-mr-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e MR_MCP_GITLAB_TOKEN=GitLab Token \
ghcr.io/metorial/mcp-container--kopfrechner--gitlab-mr-mcp--gitlab-mr-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `MR_MCP_GITLAB_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "gitlab-mr-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kopfrechner--gitlab-mr-mcp--gitlab-mr-mcp",
        "npm run start"
      ],
      "env": {
        "MR_MCP_GITLAB_TOKEN": "GitLab Token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kopfrechner/gitlab-mr-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  