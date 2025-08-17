
# Job Searchoor MCP Server

A containerized version of "Job Searchoor MCP Server"

> Repository: [0xDAEF0F/job-searchoor](https://github.com/0xDAEF0F/job-searchoor)

## Description

An MCP server implementation that provides job search functionality.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--0xdaef0f--job-searchoor--job-searchoor
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--0xdaef0f--job-searchoor--job-searchoor  "bun run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "job-searchoor": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--0xdaef0f--job-searchoor--job-searchoor",
        "bun run start"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/0xDAEF0F/job-searchoor) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  