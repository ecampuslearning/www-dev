
# mcp-kibela 🗒️

A containerized version of "mcp-kibela 🗒️"

> Repository: [kj455/mcp-kibela](https://github.com/kj455/mcp-kibela)

## Description

A Model Context Protocol (MCP) server implementation that enables AI assistants to search and reference Kibela content. This setup allows AI models like Claude to securely access information stored in Kibela.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kj455--mcp-kibela--mcp-kibela
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KIBELA_TEAM=kibela-team -e KIBELA_TOKEN=kibela-token \
ghcr.io/metorial/mcp-container--kj455--mcp-kibela--mcp-kibela  "node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KIBELA_TEAM`
- `KIBELA_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-kibela": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kj455--mcp-kibela--mcp-kibela",
        "node ./dist/index.js"
      ],
      "env": {
        "KIBELA_TEAM": "kibela-team",
        "KIBELA_TOKEN": "kibela-token"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kj455/mcp-kibela) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  