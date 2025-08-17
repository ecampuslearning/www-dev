
# 21st.dev Magic AI Agent MCP Server

A containerized version of "21st.dev Magic AI Agent MCP Server"

> Repository: [21st-dev/magic-mcp](https://github.com/21st-dev/magic-mcp)

## Description

Magic Component Platform (MCP) is a powerful AI-driven tool that helps developers create beautiful, modern UI components instantly through natural language descriptions. It integrates seamlessly with popular IDEs and provides a streamlined workflow for UI development.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--21st-dev--magic-mcp--magic-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--21st-dev--magic-mcp--magic-mcp  "npm run start --api-key api-key"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--api-key`






## Usage with Claude

```json
{
  "mcpServers": {
    "magic-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--21st-dev--magic-mcp--magic-mcp",
        "npm run start --api-key api-key"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/21st-dev/magic-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  