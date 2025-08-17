
# Framelink Figma MCP Server

A containerized version of "Framelink Figma MCP Server"

> Repository: [GLips/Figma-Context-MCP](https://github.com/GLips/Figma-Context-MCP)

## Description

Give your coding agent access to your Figma data. Implement designs in any framework in one-shot.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--glips--figma-context-mcp--figma-context-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e FIGMA_API_KEY=figma-api-key \
ghcr.io/metorial/mcp-container--glips--figma-context-mcp--figma-context-mcp --figma-api-key={{FIGMA_API_KEY}}} --stdio "pnpm run start --figma-api-key={{FIGMA_API_KEY}}} --stdio"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `FIGMA_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "figma-context-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--glips--figma-context-mcp--figma-context-mcp",
        "pnpm run start --figma-api-key={{FIGMA_API_KEY}}} --stdio"
      ],
      "env": {
        "FIGMA_API_KEY": "figma-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/GLips/Figma-Context-MCP) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  