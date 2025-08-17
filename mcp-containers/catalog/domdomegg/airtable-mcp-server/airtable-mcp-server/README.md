
# airtable-mcp-server

A containerized version of "airtable-mcp-server"

> Repository: [domdomegg/airtable-mcp-server](https://github.com/domdomegg/airtable-mcp-server)

## Description

A Model Context Protocol server that provides read and write access to Airtable databases. This server enables LLMs to inspect database schemas, then read and write records.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--domdomegg--airtable-mcp-server--airtable-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e AIRTABLE_API_KEY=airtable-api-key \
ghcr.io/metorial/mcp-container--domdomegg--airtable-mcp-server--airtable-mcp-server  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `AIRTABLE_API_KEY`




## Usage with Claude

```json
{
  "mcpServers": {
    "airtable-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--domdomegg--airtable-mcp-server--airtable-mcp-server",
        "npm run start"
      ],
      "env": {
        "AIRTABLE_API_KEY": "airtable-api-key"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/domdomegg/airtable-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  