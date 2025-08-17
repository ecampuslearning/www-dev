
# Supabase MCP Server

A containerized version of "Supabase MCP Server"

> Repository: [supabase-community/supabase-mcp](https://github.com/supabase-community/supabase-mcp)

## Description

Connect your Supabase projects to Cursor, Claude, Windsurf, and other AI assistants.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--supabase-community--supabase-mcp--mcp-server-supabase
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--supabase-community--supabase-mcp--mcp-server-supabase  "node ./dist/transports/stdio.js --access-token access-token"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--access-token`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-supabase": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--supabase-community--supabase-mcp--mcp-server-supabase",
        "node ./dist/transports/stdio.js --access-token access-token"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/supabase-community/supabase-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  