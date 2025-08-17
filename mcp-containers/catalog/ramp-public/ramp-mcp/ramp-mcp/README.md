
# Ramp MCP server

A containerized version of "Ramp MCP server"

> Repository: [ramp-public/ramp-mcp](https://github.com/ramp-public/ramp-mcp)

## Description

A Model Context Protocol server for retrieving and analyzing data or running tasks for Ramp using Developer API. In order to get around token and input size limitations, this server implements a simple ETL pipeline + ephemeral sqlite database in memory for analysis by an LLM.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ramp-public--ramp-mcp--ramp-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e RAMP_CLIENT_ID=ramp-client-id -e RAMP_CLIENT_SECRET=ramp-client-secret -e RAMP_ENV=ramp-env \
ghcr.io/metorial/mcp-container--ramp-public--ramp-mcp--ramp-mcp  "ramp-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `RAMP_CLIENT_ID`
- `RAMP_CLIENT_SECRET`
- `RAMP_ENV`




## Usage with Claude

```json
{
  "mcpServers": {
    "ramp-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ramp-public--ramp-mcp--ramp-mcp",
        "ramp-mcp"
      ],
      "env": {
        "RAMP_CLIENT_ID": "ramp-client-id",
        "RAMP_CLIENT_SECRET": "ramp-client-secret",
        "RAMP_ENV": "ramp-env"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ramp-public/ramp-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  