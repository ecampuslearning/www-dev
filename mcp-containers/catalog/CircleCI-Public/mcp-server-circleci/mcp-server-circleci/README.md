
# CircleCI MCP Server

A containerized version of "CircleCI MCP Server"

> Repository: [CircleCI-Public/mcp-server-circleci](https://github.com/CircleCI-Public/mcp-server-circleci)

## Description

Model Context Protocol (MCP) is a [new, standardized protocol](https://modelcontextprotocol.io/introduction) for managing context between large language models (LLMs) and external systems. In this repository, we provide an MCP Server for [CircleCI](https://circleci.com).


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--circleci-public--mcp-server-circleci--mcp-server-circleci
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CIRCLECI_TOKEN=circleci-token -e CIRCLECI_BASE_URL=circleci-base-url \
ghcr.io/metorial/mcp-container--circleci-public--mcp-server-circleci--mcp-server-circleci  "node ./dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CIRCLECI_TOKEN`
- `CIRCLECI_BASE_URL`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-circleci": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--circleci-public--mcp-server-circleci--mcp-server-circleci",
        "node ./dist/index.js"
      ],
      "env": {
        "CIRCLECI_TOKEN": "circleci-token",
        "CIRCLECI_BASE_URL": "circleci-base-url"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/CircleCI-Public/mcp-server-circleci) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  