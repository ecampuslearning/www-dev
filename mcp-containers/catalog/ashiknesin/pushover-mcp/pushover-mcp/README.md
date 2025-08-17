
# Pushover MCP

A containerized version of "Pushover MCP"

> Repository: [ashiknesin/pushover-mcp](https://github.com/ashiknesin/pushover-mcp)

## Description

A [Model Context Protocol](https://modelcontextprotocol.io/introduction) implementation for sending notifications via [Pushover.net](https://pushover.net).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ashiknesin--pushover-mcp--pushover-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--ashiknesin--pushover-mcp--pushover-mcp  "pnpm run start --token token --user user"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--token`
- `--user`






## Usage with Claude

```json
{
  "mcpServers": {
    "pushover-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ashiknesin--pushover-mcp--pushover-mcp",
        "pnpm run start --token token --user user"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ashiknesin/pushover-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  