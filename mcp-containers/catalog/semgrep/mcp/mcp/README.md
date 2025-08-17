
# Semgrep MCP Server

A containerized version of "Semgrep MCP Server"

> Repository: [semgrep/mcp](https://github.com/semgrep/mcp)

## Description

A Model Context Protocol (MCP) server for using [Semgrep](https://semgrep.dev) to scan code for security vulnerabilities. Secure your [vibe coding](https://semgrep.dev/blog/2025/giving-appsec-a-seat-at-the-vibe-coding-table/)! 😅


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--semgrep--mcp--mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SEMGREP_APP_TOKEN=semgrep-app-token \
ghcr.io/metorial/mcp-container--semgrep--mcp--mcp  "semgrep-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SEMGREP_APP_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--semgrep--mcp--mcp",
        "semgrep-mcp"
      ],
      "env": {
        "SEMGREP_APP_TOKEN": "semgrep-app-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/semgrep/mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  