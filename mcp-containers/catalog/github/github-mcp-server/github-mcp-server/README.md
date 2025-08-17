
# GitHub MCP Server

A containerized version of "GitHub MCP Server"

> Repository: [github/github-mcp-server](https://github.com/github/github-mcp-server)

## Description

The GitHub MCP Server is a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/introduction)


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--github--github-mcp-server--github-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e GITHUB_PERSONAL_ACCESS_TOKEN=github-personal-access-token \
ghcr.io/metorial/mcp-container--github--github-mcp-server--github-mcp-server stdio "./out stdio"
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
    "github-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--github--github-mcp-server--github-mcp-server",
        "./out stdio"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "github-personal-access-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/github/github-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  