
# GitMCP

A containerized version of "GitMCP"

> Repository: [idosal/git-mcp](https://github.com/idosal/git-mcp)

## Description

Put an end to hallucinations! GitMCP is a free, open-source, remote MCP server for any GitHub project


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--idosal--git-mcp--git-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--idosal--git-mcp--git-mcp  "exec caddy run --config /assets/Caddyfile --adapter caddyfile 2>&1"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "git-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--idosal--git-mcp--git-mcp",
        "exec caddy run --config /assets/Caddyfile --adapter caddyfile 2>&1"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/idosal/git-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  