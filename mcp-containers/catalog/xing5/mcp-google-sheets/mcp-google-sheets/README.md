
# mcp-google-sheets: A Google Sheets MCP server

A containerized version of "mcp-google-sheets: A Google Sheets MCP server"

> Repository: [xing5/mcp-google-sheets](https://github.com/xing5/mcp-google-sheets)

## Description

This MCP server integrates with your Google Drive and Google Sheets, to enable creating and modifying spreadsheets.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--xing5--mcp-google-sheets--mcp-google-sheets
```

2. Run the container:

```bash
docker run -i --rm \ 
-e SERVICE_ACCOUNT_PATH=service-account-path -e DRIVE_FOLDER_ID=drive-folder-id \
ghcr.io/metorial/mcp-container--xing5--mcp-google-sheets--mcp-google-sheets  "mcp-google-sheets"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `SERVICE_ACCOUNT_PATH`
- `DRIVE_FOLDER_ID`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-google-sheets": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--xing5--mcp-google-sheets--mcp-google-sheets",
        "mcp-google-sheets"
      ],
      "env": {
        "SERVICE_ACCOUNT_PATH": "service-account-path",
        "DRIVE_FOLDER_ID": "drive-folder-id"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/xing5/mcp-google-sheets) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  