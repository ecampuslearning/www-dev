
# Alphavantage MCP Server

A containerized version of "Alphavantage MCP Server"

> Repository: [calvernaz/alphavantage](https://github.com/calvernaz/alphavantage)

## Description

A MCP server for the stock market data API, Alphavantage API.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--calvernaz--alphavantage--alphavantage
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ALPHAVANTAGE_API_KEY=alphavantage-api-key \
ghcr.io/metorial/mcp-container--calvernaz--alphavantage--alphavantage  "alphavantage"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ALPHAVANTAGE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "alphavantage": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--calvernaz--alphavantage--alphavantage",
        "alphavantage"
      ],
      "env": {
        "ALPHAVANTAGE_API_KEY": "alphavantage-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/calvernaz/alphavantage) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  