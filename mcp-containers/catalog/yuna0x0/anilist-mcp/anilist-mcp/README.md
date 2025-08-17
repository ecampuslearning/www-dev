
# AniList MCP Server

A containerized version of "AniList MCP Server"

> Repository: [yuna0x0/anilist-mcp](https://github.com/yuna0x0/anilist-mcp)

## Description

A Model Context Protocol (MCP) server that interfaces with the AniList API, allowing LLM clients to access and interact with anime, manga, character, staff, and user data from AniList.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--yuna0x0--anilist-mcp--anilist-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ANILIST_TOKEN=anilist-token \
ghcr.io/metorial/mcp-container--yuna0x0--anilist-mcp--anilist-mcp  "pnpm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ANILIST_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "anilist-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--yuna0x0--anilist-mcp--anilist-mcp",
        "pnpm run start"
      ],
      "env": {
        "ANILIST_TOKEN": "anilist-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/yuna0x0/anilist-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  