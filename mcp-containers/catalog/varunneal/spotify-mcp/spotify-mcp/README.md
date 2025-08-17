
# spotify-mcp MCP server

A containerized version of "spotify-mcp MCP server"

> Repository: [varunneal/spotify-mcp](https://github.com/varunneal/spotify-mcp)

## Description

MCP project to connect Claude with Spotify. Built on top of [spotipy-dev's API](https://github.com/spotipy-dev/spotipy/tree/2.24.0).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--varunneal--spotify-mcp--spotify-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SPOTIFY_CLIENT_ID=spotify-client-id -e SPOTIFY_CLIENT_SECRET=spotify-client-secret -e SPOTIFY_REDIRECT_URI=spotify-redirect-uri \
ghcr.io/metorial/mcp-container--varunneal--spotify-mcp--spotify-mcp  "spotify-mcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SPOTIFY_CLIENT_ID`
- `SPOTIFY_CLIENT_SECRET`
- `SPOTIFY_REDIRECT_URI`




## Usage with Claude

```json
{
  "mcpServers": {
    "spotify-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--varunneal--spotify-mcp--spotify-mcp",
        "spotify-mcp"
      ],
      "env": {
        "SPOTIFY_CLIENT_ID": "spotify-client-id",
        "SPOTIFY_CLIENT_SECRET": "spotify-client-secret",
        "SPOTIFY_REDIRECT_URI": "spotify-redirect-uri"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/varunneal/spotify-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  