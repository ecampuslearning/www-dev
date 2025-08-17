
# Cloudinary MCP Server

A containerized version of "Cloudinary MCP Server"

> Repository: [felores/cloudinary-mcp-server](https://github.com/felores/cloudinary-mcp-server)

## Description

This MCP server provides tools for uploading images and videos to Cloudinary through Claude Desktop and compatible MCP clients.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--felores--cloudinary-mcp-server--cloudinary-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CLOUDINARY_CLOUD_NAME=cloudinary-cloud-name -e CLOUDINARY_API_KEY=cloudinary-api-key -e CLOUDINARY_API_SECRET=cloudinary-api-secret \
ghcr.io/metorial/mcp-container--felores--cloudinary-mcp-server--cloudinary-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CLOUDINARY_CLOUD_NAME`
- `CLOUDINARY_API_KEY`
- `CLOUDINARY_API_SECRET`




## Usage with Claude

```json
{
  "mcpServers": {
    "cloudinary-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--felores--cloudinary-mcp-server--cloudinary-mcp-server",
        "npm run start"
      ],
      "env": {
        "CLOUDINARY_CLOUD_NAME": "cloudinary-cloud-name",
        "CLOUDINARY_API_KEY": "cloudinary-api-key",
        "CLOUDINARY_API_SECRET": "cloudinary-api-secret"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/felores/cloudinary-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  