
# Dune Analytics MCP Server

A containerized version of "Dune Analytics MCP Server"

> Repository: [kukapay/dune-analytics-mcp](https://github.com/kukapay/dune-analytics-mcp)

## Description

An MCP server that bridges Dune Analytics data to AI agents.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kukapay--dune-analytics-mcp--dune-analytics-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DUNE_API_KEY=dune-api-key \
ghcr.io/metorial/mcp-container--kukapay--dune-analytics-mcp--dune-analytics-mcp  "python main.py"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DUNE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "dune-analytics-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kukapay--dune-analytics-mcp--dune-analytics-mcp",
        "python main.py"
      ],
      "env": {
        "DUNE_API_KEY": "dune-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kukapay/dune-analytics-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  