
# ClaudePost

A containerized version of "ClaudePost"

> Repository: [ZilongXue/claude-post](https://github.com/ZilongXue/claude-post)

## Description

A Model Context Protocol (MCP) server that provides a seamless email management interface through Claude. This integration allows you to handle emails directly through natural language conversations with Claude, supporting features like searching, reading, and sending emails securely.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--zilongxue--claude-post--claude-post
```

2. Run the container:

```bash
docker run -i --rm \ 
-e EMAIL_ADDRESS=email-address -e EMAIL_PASSWORD=email-password -e IMAP_SERVER=imap-server -e SMTP_SERVER=smtp-server -e SMTP_PORT=smtp-port \
ghcr.io/metorial/mcp-container--zilongxue--claude-post--claude-post  "email-client"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `EMAIL_ADDRESS`
- `EMAIL_PASSWORD`
- `IMAP_SERVER`
- `SMTP_SERVER`
- `SMTP_PORT`




## Usage with Claude

```json
{
  "mcpServers": {
    "claude-post": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--zilongxue--claude-post--claude-post",
        "email-client"
      ],
      "env": {
        "EMAIL_ADDRESS": "email-address",
        "EMAIL_PASSWORD": "email-password",
        "IMAP_SERVER": "imap-server",
        "SMTP_SERVER": "smtp-server",
        "SMTP_PORT": "smtp-port"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/ZilongXue/claude-post) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  