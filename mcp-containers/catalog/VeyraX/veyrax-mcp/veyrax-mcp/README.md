
# VeyraX MCP

A containerized version of "VeyraX MCP"

> Repository: [VeyraX/veyrax-mcp](https://github.com/VeyraX/veyrax-mcp)

## Description

**Single tool to control them all** — VeyraX MCP is the only connection you need to access all your tools in any MCP-compatible environment.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--veyrax--veyrax-mcp--veyrax-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e VEYRAX_API_KEY=VeyraX API Key \
ghcr.io/metorial/mcp-container--veyrax--veyrax-mcp--veyrax-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `VEYRAX_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "veyrax-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--veyrax--veyrax-mcp--veyrax-mcp",
        "npm run start"
      ],
      "env": {
        "VEYRAX_API_KEY": "VeyraX API Key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/VeyraX/veyrax-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  