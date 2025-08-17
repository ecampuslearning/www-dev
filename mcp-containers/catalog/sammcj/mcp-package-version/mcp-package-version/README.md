
# Package Version MCP Server

A containerized version of "Package Version MCP Server"

> Repository: [sammcj/mcp-package-version](https://github.com/sammcj/mcp-package-version)

## Description

An MCP server that provides tools for checking latest stable package versions from multiple package registries.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--sammcj--mcp-package-version--mcp-package-version
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--sammcj--mcp-package-version--mcp-package-version  "./out --transport transport --base-url base-url"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--transport`
- `--base-url`






## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-package-version": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--sammcj--mcp-package-version--mcp-package-version",
        "./out --transport transport --base-url base-url"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/sammcj/mcp-package-version) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  