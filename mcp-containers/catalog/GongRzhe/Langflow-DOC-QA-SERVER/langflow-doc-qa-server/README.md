
# Langflow-DOC-QA-SERVER

A containerized version of "Langflow-DOC-QA-SERVER"

> Repository: [GongRzhe/Langflow-DOC-QA-SERVER](https://github.com/GongRzhe/Langflow-DOC-QA-SERVER)

## Description

A Model Context Protocol server for document Q\&A powered by Langflow


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--gongrzhe--langflow-doc-qa-server--langflow-doc-qa-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e API_ENDPOINT=api-endpoint \
ghcr.io/metorial/mcp-container--gongrzhe--langflow-doc-qa-server--langflow-doc-qa-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `API_ENDPOINT`




## Usage with Claude

```json
{
  "mcpServers": {
    "langflow-doc-qa-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--gongrzhe--langflow-doc-qa-server--langflow-doc-qa-server",
        "node ./build/index.js"
      ],
      "env": {
        "API_ENDPOINT": "api-endpoint"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/GongRzhe/Langflow-DOC-QA-SERVER) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  