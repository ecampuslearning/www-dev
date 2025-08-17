
# browser-use-mcp-server

A containerized version of "browser-use-mcp-server"

> Repository: [co-browser/browser-use-mcp-server](https://github.com/co-browser/browser-use-mcp-server)

## Description

An MCP server that enables AI agents to control web browsers using browser-use.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--co-browser--browser-use-mcp-server--browser-use-mcp-server
```

2. Run the container:

```bash
docker run -i --rm \ 
-e OPENAI_API_KEY=openai-api-key -e CHROME_PATH=chrome-path -e PATIENT=patient \
ghcr.io/metorial/mcp-container--co-browser--browser-use-mcp-server--browser-use-mcp-server  "browser-use-mcp-server --no-shell no-shell --port port --proxy-port port --stdio stdio --vnc vnc"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:


#### Arguments

- `--no-shell`
- `--port`
- `--proxy-port`
- `--stdio`
- `--vnc`



#### Environment Variables

- `OPENAI_API_KEY`
- `CHROME_PATH`
- `PATIENT`




## Usage with Claude

```json
{
  "mcpServers": {
    "browser-use-mcp-server": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--co-browser--browser-use-mcp-server--browser-use-mcp-server",
        "browser-use-mcp-server --no-shell no-shell --port port --proxy-port port --stdio stdio --vnc vnc"
      ],
      "env": {
        "OPENAI_API_KEY": "openai-api-key",
        "CHROME_PATH": "chrome-path",
        "PATIENT": "patient"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/co-browser/browser-use-mcp-server) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  