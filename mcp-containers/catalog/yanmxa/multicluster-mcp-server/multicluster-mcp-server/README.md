
# Multicluster MCP server

A containerized version of "Multicluster MCP server"

> Repository: [yanmxa/multicluster-mcp-server](https://github.com/yanmxa/multicluster-mcp-server)

## Description

The **Multi-Cluster MCP Server** provides a robust gateway for Generative AI (GenAI) systems to interact with multiple Kubernetes clusters through the Model Context Protocol (MCP). It facilitates comprehensive operations on Kubernetes resources, streamlined multi-cluster management, and delivered interactive cluster observability.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--yanmxa--multicluster-mcp-server--multicluster-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e KUBECONFIG=kubeconfig \
ghcr.io/metorial/mcp-container--yanmxa--multicluster-mcp-server--multicluster-mcp-server  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `KUBECONFIG`




## Usage with Claude

```json
{
  "mcpServers": {
    "multicluster-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--yanmxa--multicluster-mcp-server--multicluster-mcp-server",
        "node ./build/index.js"
      ],
      "env": {
        "KUBECONFIG": "kubeconfig"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/yanmxa/multicluster-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  