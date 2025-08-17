
# Flowcore Platform MCP Server

A containerized version of "Flowcore Platform MCP Server"

> Repository: [flowcore-io/mcp-flowcore-platform](https://github.com/flowcore-io/mcp-flowcore-platform)

## Description

A Model Context Protocol (MCP) server for managing and interacting with the Flowcore Platform.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--flowcore-io--mcp-flowcore-platform--mcp-flowcore-platform
```

2. Run the container:

```bash
docker run -i --rm \ 
-e USERNAME=username \
ghcr.io/metorial/mcp-container--flowcore-io--mcp-flowcore-platform--mcp-flowcore-platform  "node ./dist/index.js --username username --pat pat"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--username`
- `--pat`



#### Environment Variables

- `USERNAME`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-flowcore-platform": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--flowcore-io--mcp-flowcore-platform--mcp-flowcore-platform",
        "node ./dist/index.js --username username --pat pat"
      ],
      "env": {
        "USERNAME": "username"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/flowcore-io/mcp-flowcore-platform) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  