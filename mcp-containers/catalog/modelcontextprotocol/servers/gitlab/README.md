
# GitLab MCP Server

A containerized version of "GitLab MCP Server"

> Repository: [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers)

## Description

MCP Server for the GitLab API, enabling project management, file operations, and more.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--gitlab
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GITLAB_PERSONAL_ACCESS_TOKEN=gitlab-personal-access-token -e GITLAB_API_URL=gitlab-api-url \
ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--gitlab  "cd ./src/gitlab && node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GITLAB_PERSONAL_ACCESS_TOKEN`
- `GITLAB_API_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "gitlab": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--modelcontextprotocol--servers--gitlab",
        "cd ./src/gitlab && node ./dist/index.js"
      ],
      "env": {
        "GITLAB_PERSONAL_ACCESS_TOKEN": "gitlab-personal-access-token",
        "GITLAB_API_URL": "gitlab-api-url"
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
  