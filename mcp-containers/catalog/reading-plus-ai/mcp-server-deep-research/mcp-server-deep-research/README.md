
# MCP Server for Deep Research

A containerized version of "MCP Server for Deep Research"

> Repository: [reading-plus-ai/mcp-server-deep-research](https://github.com/reading-plus-ai/mcp-server-deep-research)

## Description

MCP Server for Deep Research is a tool designed for conducting comprehensive research on complex topics. It helps you explore questions in depth, find relevant sources, and generate structured research reports.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--reading-plus-ai--mcp-server-deep-research--mcp-server-deep-research
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--reading-plus-ai--mcp-server-deep-research--mcp-server-deep-research  "mcp-server-deep-research"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-deep-research": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--reading-plus-ai--mcp-server-deep-research--mcp-server-deep-research",
        "mcp-server-deep-research"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/reading-plus-ai/mcp-server-deep-research) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  