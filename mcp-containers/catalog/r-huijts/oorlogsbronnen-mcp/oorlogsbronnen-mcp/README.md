
# Oorlogsbronnen MCP Server

A containerized version of "Oorlogsbronnen MCP Server"

> Repository: [r-huijts/oorlogsbronnen-mcp](https://github.com/r-huijts/oorlogsbronnen-mcp)

## Description

A Model Context Protocol (MCP) server that provides AI-powered access to the Oorlogsbronnen (War Sources) database. This server enables natural language interactions with historical World War II archives from the Netherlands.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--r-huijts--oorlogsbronnen-mcp--oorlogsbronnen-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--r-huijts--oorlogsbronnen-mcp--oorlogsbronnen-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "oorlogsbronnen-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--r-huijts--oorlogsbronnen-mcp--oorlogsbronnen-mcp",
        "npm run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/r-huijts/oorlogsbronnen-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  