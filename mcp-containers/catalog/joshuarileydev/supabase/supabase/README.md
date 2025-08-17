
# Supabase MCP Server

A containerized version of "Supabase MCP Server"

> Repository: [joshuarileydev/supabase](https://github.com/joshuarileydev/supabase)

## Description

A Model Context Protocol (MCP) server that provides programmatic access to the Supabase Management API. This server allows AI models and other clients to manage Supabase projects and organizations through a standardized interface.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--joshuarileydev--supabase--supabase
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SUPABASE_API_KEY=supabase-api-key \
ghcr.io/metorial/mcp-container--joshuarileydev--supabase--supabase  "node dist/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SUPABASE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "supabase": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--joshuarileydev--supabase--supabase",
        "node dist/index.js"
      ],
      "env": {
        "SUPABASE_API_KEY": "supabase-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/joshuarileydev/supabase) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  