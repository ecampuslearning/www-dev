
# mcp-k8s

A containerized version of "mcp-k8s"

> Repository: [silenceper/mcp-k8s](https://github.com/silenceper/mcp-k8s)

## Description

A Kubernetes MCP (Model Control Protocol) server that enables interaction with Kubernetes clusters through MCP tools.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--silenceper--mcp-k8s--mcp-k-8-s
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--silenceper--mcp-k8s--mcp-k-8-s  "./out --kubeconfig kubeconfig --enable-create enable-create --enable-update enable-update --enable-delete enable-delete"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--kubeconfig`
- `--enable-create`
- `--enable-update`
- `--enable-delete`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-k-8-s": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--silenceper--mcp-k8s--mcp-k-8-s",
        "./out --kubeconfig kubeconfig --enable-create enable-create --enable-update enable-update --enable-delete enable-delete"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/silenceper/mcp-k8s) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  