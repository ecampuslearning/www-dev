
# PostHog MCP Server 📊

A containerized version of "PostHog MCP Server 📊"

> Repository: [PostHog/posthog-mcp](https://github.com/PostHog/posthog-mcp)

## Description

A Model Context Protocol (MCP) server for interacting with PostHog. Create annotations and manage projects directly through Claude Desktop!


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--posthog--posthog-mcp--posthog-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e PERSONAL_API_KEY=personal-api-key \
ghcr.io/metorial/mcp-container--posthog--posthog-mcp--posthog-mcp  "posthog-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `PERSONAL_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "posthog-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--posthog--posthog-mcp--posthog-mcp",
        "posthog-mcp"
      ],
      "env": {
        "PERSONAL_API_KEY": "personal-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/PostHog/posthog-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  