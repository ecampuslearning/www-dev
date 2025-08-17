
# Deepseek R1 MCP Server

A containerized version of "Deepseek R1 MCP Server"

> Repository: [66julienmartin/MCP-server-Deepseek_R1](https://github.com/66julienmartin/MCP-server-Deepseek_R1)

## Description

A Model Context Protocol (MCP) server implementation for the Deepseek R1 language model. Deepseek R1 is a powerful language model optimized for reasoning tasks with a context window of 8192 tokens.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--66julienmartin--mcp-server-deepseek_r1--mcp-server-deepseek-r-1
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DEEPSEEK_API_KEY=deepseek-api-key \
ghcr.io/metorial/mcp-container--66julienmartin--mcp-server-deepseek_r1--mcp-server-deepseek-r-1  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DEEPSEEK_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-server-deepseek-r-1": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--66julienmartin--mcp-server-deepseek_r1--mcp-server-deepseek-r-1",
        "npm run start"
      ],
      "env": {
        "DEEPSEEK_API_KEY": "deepseek-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/66julienmartin/MCP-server-Deepseek_R1) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  