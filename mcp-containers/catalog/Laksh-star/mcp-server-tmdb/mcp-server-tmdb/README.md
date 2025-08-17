
# TMDB MCP Server

A containerized version of "TMDB MCP Server"

> Repository: [Laksh-star/mcp-server-tmdb](https://github.com/Laksh-star/mcp-server-tmdb)

## Description

This MCP server integrates with The Movie Database (TMDB) API to provide movie information, search capabilities, and recommendations.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--laksh-star--mcp-server-tmdb--mcp-server-tmdb
```

2. Run the container:

```bash
docker run -i --rm \ 
-e TMDB_API_KEY=tmdb-api-key \
ghcr.io/metorial/mcp-container--laksh-star--mcp-server-tmdb--mcp-server-tmdb  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `TMDB_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-tmdb": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--laksh-star--mcp-server-tmdb--mcp-server-tmdb",
        "node dist/index.js"
      ],
      "env": {
        "TMDB_API_KEY": "tmdb-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/Laksh-star/mcp-server-tmdb) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  