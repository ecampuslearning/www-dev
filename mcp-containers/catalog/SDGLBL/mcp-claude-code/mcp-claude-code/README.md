
# MCP Claude Code

A containerized version of "MCP Claude Code"

> Repository: [SDGLBL/mcp-claude-code](https://github.com/SDGLBL/mcp-claude-code)

## Description

An implementation of Claude Code capabilities using the Model Context Protocol (MCP).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--sdglbl--mcp-claude-code--mcp-claude-code
```

2. Run the container:

```bash
docker run -i --rm \ 
-e USEFUL_PROMPTS=useful-prompts \
ghcr.io/metorial/mcp-container--sdglbl--mcp-claude-code--mcp-claude-code  "claudecode"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `USEFUL_PROMPTS`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-claude-code": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--sdglbl--mcp-claude-code--mcp-claude-code",
        "claudecode"
      ],
      "env": {
        "USEFUL_PROMPTS": "useful-prompts"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/SDGLBL/mcp-claude-code) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  