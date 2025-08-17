
# TFT MCP Server

A containerized version of "TFT MCP Server"

> Repository: [GeLi2001/tft-mcp-server](https://github.com/GeLi2001/tft-mcp-server)

## Description

This is a Model Context Protocol (MCP) server for Team Fight Tactics (TFT) that provides access to TFT game data through various tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--geli2001--tft-mcp-server--tft-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--geli2001--tft-mcp-server--tft-mcp-server  "npm run start --apiKey riot-api-key --gameName game-name --tagLine tag-line"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--apiKey`
- `--gameName`
- `--tagLine`






## Usage with Claude

```json
{
  "mcpServers": {
    "tft-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--geli2001--tft-mcp-server--tft-mcp-server",
        "npm run start --apiKey riot-api-key --gameName game-name --tagLine tag-line"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/GeLi2001/tft-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  