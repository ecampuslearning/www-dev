
# Heroku MCP Server

A containerized version of "Heroku MCP Server"

> Repository: [heroku/heroku-mcp-server](https://github.com/heroku/heroku-mcp-server)

## Description

The Heroku Platform MCP Server works on Common Runtime, Cedar Private and Shield Spaces, and Fir Private Spaces.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--heroku--heroku-mcp-server--heroku-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e HEROKU_API_KEY=heroku-api-key \
ghcr.io/metorial/mcp-container--heroku--heroku-mcp-server--heroku-mcp-server  "heroku mcp:start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `HEROKU_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "heroku-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--heroku--heroku-mcp-server--heroku-mcp-server",
        "heroku mcp:start"
      ],
      "env": {
        "HEROKU_API_KEY": "heroku-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/heroku/heroku-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  