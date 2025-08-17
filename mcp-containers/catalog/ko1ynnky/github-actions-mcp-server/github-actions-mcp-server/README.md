
# GitHub Actions MCP Server

A containerized version of "GitHub Actions MCP Server"

> Repository: [ko1ynnky/github-actions-mcp-server](https://github.com/ko1ynnky/github-actions-mcp-server)

## Description

MCP Server for the GitHub Actions API, enabling AI assistants to manage and operate GitHub Actions workflows.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ko1ynnky--github-actions-mcp-server--github-actions-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GITHUB_PERSONAL_ACCESS_TOKEN=github-personal-access-token \
ghcr.io/metorial/mcp-container--ko1ynnky--github-actions-mcp-server--github-actions-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `GITHUB_PERSONAL_ACCESS_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "github-actions-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ko1ynnky--github-actions-mcp-server--github-actions-mcp-server",
        "npm run start"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "github-personal-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ko1ynnky/github-actions-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  