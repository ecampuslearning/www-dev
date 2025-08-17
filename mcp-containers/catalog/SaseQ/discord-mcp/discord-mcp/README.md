
# Discord MCP

A containerized version of "Discord MCP"

> Repository: [SaseQ/discord-mcp](https://github.com/SaseQ/discord-mcp)

## Description

A [Model Context Protocol (MCP)](https://modelcontextprotocol.io/introduction) server for the Discord API [(JDA)](https://jda.wiki/),


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--saseq--discord-mcp--discord-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DISCORD_TOKEN=discord-token \
ghcr.io/metorial/mcp-container--saseq--discord-mcp--discord-mcp  "java -Dserver.port=$PORT $JAVA_OPTS -jar target/*jar"
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
    "discord-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--saseq--discord-mcp--discord-mcp",
        "java -Dserver.port=$PORT $JAVA_OPTS -jar target/*jar"
      ],
      "env": {
        "DISCORD_TOKEN": "discord-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/SaseQ/discord-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  