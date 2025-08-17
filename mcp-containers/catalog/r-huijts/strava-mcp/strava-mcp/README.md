
# Strava MCP Server

A containerized version of "Strava MCP Server"

> Repository: [r-huijts/strava-mcp](https://github.com/r-huijts/strava-mcp)

## Description

This project implements a Model Context Protocol (MCP) server in TypeScript that acts as a bridge to the Strava API. It exposes Strava data and functionalities as "tools" that Large Language Models (LLMs) can utilize through the MCP standard.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--r-huijts--strava-mcp--strava-mcp
```

2. Run the container:

```bash
docker run -i --rm \ 
-e STRAVA_CLIENT_ID=STRAVA_CLIENT_ID -e STRAVA_CLIENT_SECRET=STRAVA_CLIENT_SECRET -e STRAVA_ACCESS_TOKEN=STRAVA_ACCESS_TOKEN -e STRAVA_REFRESH_TOKEN=STRAVA_REFRESH_TOKEN \
ghcr.io/metorial/mcp-container--r-huijts--strava-mcp--strava-mcp  "npm run start"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `STRAVA_CLIENT_ID`
- `STRAVA_CLIENT_SECRET`
- `STRAVA_ACCESS_TOKEN`
- `STRAVA_REFRESH_TOKEN`




## Usage with Claude

```json
{
  "mcpServers": {
    "strava-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--r-huijts--strava-mcp--strava-mcp",
        "npm run start"
      ],
      "env": {
        "STRAVA_CLIENT_ID": "STRAVA_CLIENT_ID",
        "STRAVA_CLIENT_SECRET": "STRAVA_CLIENT_SECRET",
        "STRAVA_ACCESS_TOKEN": "STRAVA_ACCESS_TOKEN",
        "STRAVA_REFRESH_TOKEN": "STRAVA_REFRESH_TOKEN"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/r-huijts/strava-mcp) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  