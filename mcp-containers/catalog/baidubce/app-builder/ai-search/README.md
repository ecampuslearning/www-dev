
# Baidu AI Search

A containerized version of "Baidu AI Search"

> Repository: [baidubce/app-builder](https://github.com/baidubce/app-builder)

## Description

Baidu AI Search component combines Baidu's search capabilities with large language model technology to provide intelligent responses with real-time web information references, supporting various industry application scenarios. It offers rich standardized capabilities such as:


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--baidubce--app-builder--ai-search
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--baidubce--app-builder--ai-search  
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "ai-search": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--baidubce--app-builder--ai-search"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/baidubce/app-builder) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  