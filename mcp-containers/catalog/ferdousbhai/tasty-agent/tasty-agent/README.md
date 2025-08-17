
# tasty-agent: A TastyTrade MCP Server

A containerized version of "tasty-agent: A TastyTrade MCP Server"

> Repository: [ferdousbhai/tasty-agent](https://github.com/ferdousbhai/tasty-agent)

## Description

Let Claude manage your tastytrade portfolio.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ferdousbhai--tasty-agent--tasty-agent
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--ferdousbhai--tasty-agent--tasty-agent  "tasty-agent"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "tasty-agent": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ferdousbhai--tasty-agent--tasty-agent",
        "tasty-agent"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ferdousbhai/tasty-agent) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  