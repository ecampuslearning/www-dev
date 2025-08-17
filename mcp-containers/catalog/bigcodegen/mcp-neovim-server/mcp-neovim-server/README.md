
# Neovim MCP Server

A containerized version of "Neovim MCP Server"

> Repository: [bigcodegen/mcp-neovim-server](https://github.com/bigcodegen/mcp-neovim-server)

## Description

A proof of concept integration between Claude Desktop (or any client) and Neovim using Model Context Protocol (MCP) and the official neovim/node-client JavaScript library. This server leverages Vim's native text editing commands and workflows, which Claude already understands, to create a lightweight code or general purpose AI text assistance layer.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--bigcodegen--mcp-neovim-server--mcp-neovim-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ALLOW_SHELL_COMMANDS=allow-shell-commands -e NVIM_SOCKET_PATH=nvim-socket-path \
ghcr.io/metorial/mcp-container--bigcodegen--mcp-neovim-server--mcp-neovim-server  "node build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ALLOW_SHELL_COMMANDS`
- `NVIM_SOCKET_PATH`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-neovim-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--bigcodegen--mcp-neovim-server--mcp-neovim-server",
        "node build/index.js"
      ],
      "env": {
        "ALLOW_SHELL_COMMANDS": "allow-shell-commands",
        "NVIM_SOCKET_PATH": "nvim-socket-path"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/bigcodegen/mcp-neovim-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  