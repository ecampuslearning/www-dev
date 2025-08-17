
# 🗄️ MongoDB MCP Server for LLMS

A containerized version of "🗄️ MongoDB MCP Server for LLMS"

> Repository: [QuantGeekDev/mongo-mcp](https://github.com/QuantGeekDev/mongo-mcp)

## Description

A Model Context Protocol (MCP) server that enables LLMs to interact directly with MongoDB databases. Query collections, inspect schemas, and manage data seamlessly through natural language.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--quantgeekdev--mongo-mcp--mongo-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--quantgeekdev--mongo-mcp--mongo-mcp {{MONGODB_URI}} "node dist/index.js {{MONGODB_URI}}"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `{{MONGODB_URI}}`






## Usage with Claude

```json
{
  "mcpServers": {
    "mongo-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--quantgeekdev--mongo-mcp--mongo-mcp",
        "node dist/index.js {{MONGODB_URI}}"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/QuantGeekDev/mongo-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  