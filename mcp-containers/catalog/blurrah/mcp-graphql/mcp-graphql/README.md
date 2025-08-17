
# mcp-graphql

A containerized version of "mcp-graphql"

> Repository: [blurrah/mcp-graphql](https://github.com/blurrah/mcp-graphql)

## Description

A Model Context Protocol server that enables LLMs to interact with GraphQL APIs. This implementation provides schema introspection and query execution capabilities, allowing models to discover and use GraphQL APIs dynamically.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--blurrah--mcp-graphql--mcp-graphql
```

2. Run the container:

```bash
docker run -i --rm \ 
-e ENDPOINT=endpoint \
ghcr.io/metorial/mcp-container--blurrah--mcp-graphql--mcp-graphql  "bun run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `ENDPOINT`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-graphql": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--blurrah--mcp-graphql--mcp-graphql",
        "bun run start"
      ],
      "env": {
        "ENDPOINT": "endpoint"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/blurrah/mcp-graphql) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  