
# Model Context Protocol (MCP) Server + Strava OAuth

A containerized version of "Model Context Protocol (MCP) Server + Strava OAuth"

> Repository: [kw510/strava-mcp](https://github.com/kw510/strava-mcp)

## Description

This is a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/introduction) server that supports remote MCP connections, with Strava OAuth built-in. It allows users to connect to your MCP server by signing in with their Strava account.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--kw510--strava-mcp--strava-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--kw510--strava-mcp--strava-mcp https://mcp-strava-oauth.<your-subdomain>.workers.dev/sse "yarn run start https://mcp-strava-oauth.<your-subdomain>.workers.dev/sse"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "strava-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--kw510--strava-mcp--strava-mcp",
        "yarn run start https://mcp-strava-oauth.<your-subdomain>.workers.dev/sse"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/kw510/strava-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  