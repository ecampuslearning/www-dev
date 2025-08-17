
# # mcp-difyworkflow-server

A containerized version of "# mcp-difyworkflow-server"

> Repository: [gotoolkits/mcp-difyworkflow-server](https://github.com/gotoolkits/mcp-difyworkflow-server)

## Description

mcp-difyworkflow-server is an mcp server Tools application that implements the query and invocation of Dify workflows, supporting the on-demand operation of multiple custom Dify workflows.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--gotoolkits--mcp-difyworkflow-server--mcp-difyworkflow-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e DIFY_WORKFLOW_NAME=dify-workflow-name -e DIFY_API_KEYS=dify-api-keys \
ghcr.io/metorial/mcp-container--gotoolkits--mcp-difyworkflow-server--mcp-difyworkflow-server  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `DIFY_WORKFLOW_NAME`
- `DIFY_API_KEYS`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-difyworkflow-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--gotoolkits--mcp-difyworkflow-server--mcp-difyworkflow-server",
        "./out"
      ],
      "env": {
        "DIFY_WORKFLOW_NAME": "dify-workflow-name",
        "DIFY_API_KEYS": "dify-api-keys"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/gotoolkits/mcp-difyworkflow-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  