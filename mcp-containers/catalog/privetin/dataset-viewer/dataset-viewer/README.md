
# Dataset Viewer MCP Server

A containerized version of "Dataset Viewer MCP Server"

> Repository: [privetin/dataset-viewer](https://github.com/privetin/dataset-viewer)

## Description

An MCP server for interacting with the [Hugging Face Dataset Viewer API](https://huggingface.co/docs/dataset-viewer), providing capabilities to browse and analyze datasets hosted on the Hugging Face Hub.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--privetin--dataset-viewer--dataset-viewer
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--privetin--dataset-viewer--dataset-viewer  "dataset-viewer"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "dataset-viewer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--privetin--dataset-viewer--dataset-viewer",
        "dataset-viewer"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/privetin/dataset-viewer) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  