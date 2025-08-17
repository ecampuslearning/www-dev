
# FileScopeMCP (Model Context Protocol) Server

A containerized version of "FileScopeMCP (Model Context Protocol) Server"

> Repository: [admica/FileScopeMCP](https://github.com/admica/FileScopeMCP)

## Description

**✨ Instantly understand and visualize your codebase structure & dependencies! ✨**


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--admica--filescopemcp--file-scope-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--admica--filescopemcp--file-scope-mcp  "npm run start --base-dir base-dir"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--base-dir`






## Usage with Claude

```json
{
  "mcpServers": {
    "file-scope-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--admica--filescopemcp--file-scope-mcp",
        "npm run start --base-dir base-dir"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/admica/FileScopeMCP) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  