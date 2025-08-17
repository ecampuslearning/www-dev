
# Pinecone Model Context Protocol Server.

A containerized version of "Pinecone Model Context Protocol Server."

> Repository: [sirmews/mcp-pinecone](https://github.com/sirmews/mcp-pinecone)

## Description

Read and write to a Pinecone index.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--sirmews--mcp-pinecone--mcp-pinecone
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--sirmews--mcp-pinecone--mcp-pinecone  "mcp-pinecone --index-name index-name --api-key api-key"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--index-name`
- `--api-key`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-pinecone": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--sirmews--mcp-pinecone--mcp-pinecone",
        "mcp-pinecone --index-name index-name --api-key api-key"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/sirmews/mcp-pinecone) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  