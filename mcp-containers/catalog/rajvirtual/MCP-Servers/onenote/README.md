
# OneNote MCP Server

A containerized version of "OneNote MCP Server"

> Repository: [rajvirtual/MCP-Servers](https://github.com/rajvirtual/MCP-Servers)

## Description

A Model Context Protocol (MCP) server that provides AI assistants with access to Microsoft OneNote. This server enables AI models to read from and write to OneNote notebooks, sections, and pages.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--rajvirtual--mcp-servers--onenote
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CLIENT_ID=client-id \
ghcr.io/metorial/mcp-container--rajvirtual--mcp-servers--onenote  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CLIENT_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "onenote": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--rajvirtual--mcp-servers--onenote",
        "npm run start"
      ],
      "env": {
        "CLIENT_ID": "client-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/rajvirtual/MCP-Servers) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  