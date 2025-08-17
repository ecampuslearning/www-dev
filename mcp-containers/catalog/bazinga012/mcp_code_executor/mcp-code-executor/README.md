
# MCP Code Executor

A containerized version of "MCP Code Executor"

> Repository: [bazinga012/mcp_code_executor](https://github.com/bazinga012/mcp_code_executor)

## Description

The MCP Code Executor is an MCP server that allows LLMs to execute Python code within a specified Conda environment. This enables LLMs to run code with access to libraries and dependencies defined in the Conda environment.


## Usage

The containers are built automatically and are available on the GitHub Container Registry.

1. Pull the Docker image:

```bash
docker pull ghcr.io/metorial/mcp-container--bazinga012--mcp_code_executor--mcp-code-executor
```

2. Run the container:

```bash
docker run -i --rm \ 
-e CODE_STORAGE_DIR=code-storage-dir -e CONDA_ENV_NAME=conda-env-name \
ghcr.io/metorial/mcp-container--bazinga012--mcp_code_executor--mcp-code-executor  "node ./build/index.js"
```

- `--rm` removes the container after it exits, so you don't have to clean up manually.
- `-i` allows you to interact with the container in your terminal.



### Configuration

The container supports the following configuration options:




#### Environment Variables

- `CODE_STORAGE_DIR`
- `CONDA_ENV_NAME`




## Usage with Claude

```json
{
  "mcpServers": {
    "mcp-code-executor": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "ghcr.io/metorial/mcp-container--bazinga012--mcp_code_executor--mcp-code-executor",
        "node ./build/index.js"
      ],
      "env": {
        "CODE_STORAGE_DIR": "code-storage-dir",
        "CONDA_ENV_NAME": "conda-env-name"
      }
    }
  }
}
```

# License

Please refer to the license provided in [the project repository](https://github.com/bazinga012/mcp_code_executor) for more information.

## Contributing

Contributions are welcome! If you notice any issues or have suggestions for improvements, please open an issue or submit a pull request.

<div align="center">
  <sub>Containerized with ❤️ by <a href="https://metorial.com">Metorial</a></sub>
</div>
  