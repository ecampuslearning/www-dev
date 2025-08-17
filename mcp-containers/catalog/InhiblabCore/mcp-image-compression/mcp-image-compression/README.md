
# Image Compression

A containerized version of "Image Compression"

> Repository: [InhiblabCore/mcp-image-compression](https://github.com/InhiblabCore/mcp-image-compression)

## Description

A high-performance image compression microservice based on MCP (Modal Context Protocol)


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--inhiblabcore--mcp-image-compression--mcp-image-compression
```

2. Run the container:

```bash
docker run -i --rm \ 
-e IMAGE_COMPRESSION_DOWNLOAD_DIR=image-compression-download-dir \
ghcr.io/metorial/mcp-container--inhiblabcore--mcp-image-compression--mcp-image-compression  "pnpm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `IMAGE_COMPRESSION_DOWNLOAD_DIR`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-image-compression": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--inhiblabcore--mcp-image-compression--mcp-image-compression",
        "pnpm run start"
      ],
      "env": {
        "IMAGE_COMPRESSION_DOWNLOAD_DIR": "image-compression-download-dir"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/InhiblabCore/mcp-image-compression) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  