
# Postmancer

A containerized version of "Postmancer"

> Repository: [hijaz/postmancer](https://github.com/hijaz/postmancer)

## Description

A standalone MCP server for API testing and management, allowing AI assistants to interact with RESTful APIs through natural language.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hijaz--postmancer--postmancer
```

2. Run the container:

```bash
docker run -i --rm \ 
-e LOG_LEVEL=log-level \
ghcr.io/metorial/mcp-container--hijaz--postmancer--postmancer  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `LOG_LEVEL`




## Usage with Claude

```json
{
  "mcpServers": {
    "postmancer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hijaz--postmancer--postmancer",
        "npm run start"
      ],
      "env": {
        "LOG_LEVEL": "log-level"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hijaz/postmancer) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  