
# Discord MCP Server

A containerized version of "Discord MCP Server"

> Repository: [v-3/discordmcp](https://github.com/v-3/discordmcp)

## Description

A Model Context Protocol (MCP) server that enables LLMs to interact with Discord channels, allowing them to send and read messages through Discord's API. Using this server, LLMs like Claude can directly interact with Discord channels while maintaining user control and security.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--v-3--discordmcp--discordmcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DISCORD_TOKEN=discord-token \
ghcr.io/metorial/mcp-container--v-3--discordmcp--discordmcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DISCORD_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "discordmcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--v-3--discordmcp--discordmcp",
        "npm run start"
      ],
      "env": {
        "DISCORD_TOKEN": "discord-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/v-3/discordmcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  