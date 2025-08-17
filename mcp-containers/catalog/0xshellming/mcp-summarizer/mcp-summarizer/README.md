
# MCP Content Summarizer Server

A containerized version of "MCP Content Summarizer Server"

> Repository: [0xshellming/mcp-summarizer](https://github.com/0xshellming/mcp-summarizer)

## Description

A Model Context Protocol (MCP) server that provides intelligent summarization capabilities for various types of content using Google's Gemini 1.5 Pro model. This server can help you generate concise summaries while maintaining key information from different content formats.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--0xshellming--mcp-summarizer--mcp-summarizer
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--0xshellming--mcp-summarizer--mcp-summarizer  "pnpm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-summarizer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--0xshellming--mcp-summarizer--mcp-summarizer",
        "pnpm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/0xshellming/mcp-summarizer) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  