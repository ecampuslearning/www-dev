
# BioMCP: Biomedical Model Context Protocol

A containerized version of "BioMCP: Biomedical Model Context Protocol"

> Repository: [genomoncology/biomcp](https://github.com/genomoncology/biomcp)

## Description

BioMCP is an open source (MIT License) toolkit for biomedical research AI


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--genomoncology--biomcp--biomcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--genomoncology--biomcp--biomcp  "biomcp"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "biomcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--genomoncology--biomcp--biomcp",
        "biomcp"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/genomoncology/biomcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  