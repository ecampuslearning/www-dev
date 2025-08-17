
# 📤 ntfy-me-mcp

A containerized version of "📤 ntfy-me-mcp"

> Repository: [gitmotion/ntfy-me-mcp](https://github.com/gitmotion/ntfy-me-mcp)

## Description

An ntfy MCP server for sending/fetching ntfy notifications to your self-hosted ntfy server from AI Agents 📤 (supports secure token auth & more - use with npx or docker!)


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--gitmotion--ntfy-me-mcp--ntfy-me-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e NTFY_TOPIC=ntfy-topic -e NTFY_URL=ntfy-url -e NTFY_TOKEN=ntfy-token \
ghcr.io/metorial/mcp-container--gitmotion--ntfy-me-mcp--ntfy-me-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `-e NTFY_TOPIC`
- `-e NTFY_URL`
- `-e NTFY_TOKEN`



#### Environment Variables

- `NTFY_TOPIC`
- `NTFY_URL`
- `NTFY_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "ntfy-me-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--gitmotion--ntfy-me-mcp--ntfy-me-mcp",
        "npm run start"
      ],
      "env": {
        "NTFY_TOPIC": "ntfy-topic",
        "NTFY_URL": "ntfy-url",
        "NTFY_TOKEN": "ntfy-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/gitmotion/ntfy-me-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  