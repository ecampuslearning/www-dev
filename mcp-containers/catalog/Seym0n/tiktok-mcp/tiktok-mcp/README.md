
# <img src="https://cdn.worldvectorlogo.com/logos/tiktok-icon-2.svg" height="32"> TikTok MCP

A containerized version of "<img src="https://cdn.worldvectorlogo.com/logos/tiktok-icon-2.svg" height="32"> TikTok MCP"

> Repository: [Seym0n/tiktok-mcp](https://github.com/Seym0n/tiktok-mcp)

## Description

The TikTok MCP integrates TikTok access into Claude AI and other apps via TikNeuron. This TikTok MCP allows you to


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--seym0n--tiktok-mcp--tiktok-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TIKNEURON_MCP_API_KEY=tikneuron-mcp-api-key \
ghcr.io/metorial/mcp-container--seym0n--tiktok-mcp--tiktok-mcp  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TIKNEURON_MCP_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "tiktok-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--seym0n--tiktok-mcp--tiktok-mcp",
        "node build/index.js"
      ],
      "env": {
        "TIKNEURON_MCP_API_KEY": "tikneuron-mcp-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Seym0n/tiktok-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  