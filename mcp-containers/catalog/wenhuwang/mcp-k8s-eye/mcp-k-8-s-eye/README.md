
# mcp-k8s-eye

A containerized version of "mcp-k8s-eye"

> Repository: [wenhuwang/mcp-k8s-eye](https://github.com/wenhuwang/mcp-k8s-eye)

## Description

mcp-k8s-eye is a tool that can manage kubernetes cluster and analyze workload status.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--wenhuwang--mcp-k8s-eye--mcp-k-8-s-eye
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--wenhuwang--mcp-k8s-eye--mcp-k-8-s-eye  "./out"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-k-8-s-eye": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--wenhuwang--mcp-k8s-eye--mcp-k-8-s-eye",
        "./out"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/wenhuwang/mcp-k8s-eye) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  