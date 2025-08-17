
# GraphQL Schema Model Context Protocol Server

A containerized version of "GraphQL Schema Model Context Protocol Server"

> Repository: [hannesj/mcp-graphql-schema](https://github.com/hannesj/mcp-graphql-schema)

## Description

A Model Context Protocol (MCP) server that exposes GraphQL schema information to Large Language Models (LLMs) like Claude. This server allows an LLM to explore and understand GraphQL schemas through a set of specialized tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hannesj--mcp-graphql-schema--mcp-graphql-schema
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--hannesj--mcp-graphql-schema--mcp-graphql-schema  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-graphql-schema": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hannesj--mcp-graphql-schema--mcp-graphql-schema",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hannesj/mcp-graphql-schema) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  