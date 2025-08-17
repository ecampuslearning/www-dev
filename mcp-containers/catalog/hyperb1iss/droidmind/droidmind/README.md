
# ✨ DroidMind 🤖

A containerized version of "✨ DroidMind 🤖"

> Repository: [hyperb1iss/droidmind](https://github.com/hyperb1iss/droidmind)

## Description

Control your Android devices with AI using Model Context Protocol


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--hyperb1iss--droidmind--droidmind
```

2. Run the container:

```bash
docker run -i --rm \ 
ghcr.io/metorial/mcp-container--hyperb1iss--droidmind--droidmind --transport stdio "droidmind --transport stdio"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.




## Usage with Claude

```json
{
  "mcpServers": {
    "droidmind": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--hyperb1iss--droidmind--droidmind",
        "droidmind --transport stdio"
      ],
      "env": {}
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/hyperb1iss/droidmind) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  