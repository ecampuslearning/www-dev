
# Watsonx.ai Flows Engine MCP Server

A containerized version of "Watsonx.ai Flows Engine MCP Server"

> Repository: [IBM/wxflows](https://github.com/IBM/wxflows)

## Description

Here's a step-by-step tutorial for setting up and deploying a project with wxflows, including installing necessary tools, deploying the app, and running it locally.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--ibm--wxflows--javascript
```

2. Run the container:

```bash
docker run -i --rm \ 
-e WXFLOWS_APIKEY=wxflows-apikey -e WXFLOWS_ENDPOINT=wxflows-endpoint \
ghcr.io/metorial/mcp-container--ibm--wxflows--javascript  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `WXFLOWS_APIKEY`
- `WXFLOWS_ENDPOINT`




## Usage with Claude

```json
{
  "mcpServers": {
    "javascript": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--ibm--wxflows--javascript",
        "node ./build/index.js"
      ],
      "env": {
        "WXFLOWS_APIKEY": "wxflows-apikey",
        "WXFLOWS_ENDPOINT": "wxflows-endpoint"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/IBM/wxflows) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  