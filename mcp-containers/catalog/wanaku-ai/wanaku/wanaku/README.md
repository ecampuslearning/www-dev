
# Wanaku - A MCP Router that connects everything

A containerized version of "Wanaku - A MCP Router that connects everything"

> Repository: [wanaku-ai/wanaku](https://github.com/wanaku-ai/wanaku)

## Description

The Wanaku MCP Router is a router for AI-enabled applications powered by the [Model Context Protocol (MCP)](https://modelcontextprotocol.io/).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--wanaku-ai--wanaku--wanaku
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--wanaku-ai--wanaku--wanaku  "java  $JAVA_OPTS -jar target/*jar"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "wanaku": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--wanaku-ai--wanaku--wanaku",
        "java  $JAVA_OPTS -jar target/*jar"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/wanaku-ai/wanaku) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  