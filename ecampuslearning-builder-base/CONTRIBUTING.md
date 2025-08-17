# Contributing to DevContainer Base

Thanks for your interest in contributing! This guide will help you get started with contributing to our devcontainer project.

## Code of Conduct

By participating in this project, you agree to abide by our code of conduct. Just be respectful and considerate of others - pretty straightforward!

## How to Contribute

### Reporting Bugs

Found a bug? Please create an issue using the bug report template. Include:

- A clear description of what went wrong
- Steps to reproduce the issue
- What you expected to happen
- Screenshots if they help explain the issue
- Your environment details (OS, Docker version, VS Code version, etc.)

### Suggesting Enhancements

Got ideas for improvements? We'd love to hear them! Create an issue using the feature request template and describe:

- What problem your enhancement would solve
- How you think it should work
- Any alternatives you've considered
- Extra context or screenshots that might help

### Security Issues

For security vulnerabilities, please follow our [Security Policy](SECURITY.md) and use GitHub's Private Vulnerability Reporting feature rather than opening a public issue.

## Getting Started with Development

### Setting Up Your Dev Environment

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR-USERNAME/devcontainer.git
   cd devcontainer
   ```
3. Add the upstream remote:
   ```bash
   git remote add upstream https://github.com/izykitten/devcontainer.git
   ```

### Making Changes

1. Create a new branch for your work:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Make your changes
3. Test them thoroughly  
4. Keep your changes focused on one issue or feature at a time

### Coding Standards

- Follow the existing code style in the project
- Write clear, descriptive commit messages
- Document your changes when needed
- Make sure you don't break existing functionality

### Pull Requests

1. Update your fork with the latest changes:
   ```bash
   git fetch upstream
   git rebase upstream/base-dev
   ```
2. Push your changes:
   ```bash
   git push origin feature/your-feature-name
   ```
3. Submit a pull request through GitHub
4. In your PR description, explain:
   - What the PR does
   - How you tested it
   - Any relevant issue numbers

### Review Process

1. Maintainers will review your PR
2. Address any feedback or requested changes
3. Once approved, a maintainer will merge your PR

## Docker and DevContainer Guidelines

### Dockerfile Best Practices

- Keep images as small as possible
- Use specific version tags for base images (we pin digests too)
- Use multi-stage builds when it makes sense
- Follow security best practices (check our [Security Policy](SECURITY.md))

### Setup Scripts

When adding or modifying setup scripts:

1. Put them in the right directory under `scripts/setup.d/`
2. Make sure they're executable and have proper error handling
3. Follow the naming convention: `XX-descriptive-name.sh`
4. Add comments explaining what the script does

### Testing Your Changes

Before submitting a PR:

1. Build the devcontainer image locally
2. Test it with a real project
3. Make sure all setup scripts run without issues
4. Verify the devcontainer works properly with VS Code

## Documentation

- Update docs when you change functionality
- Follow Markdown best practices
- Keep documentation clear, concise, and accurate

## Release Process

The maintainers handle releases, including:

- Version bumping
- Changelog updates
- Docker image publishing

## Helpful Resources

- [GitHub Docs on Contributing to Projects](https://docs.github.com/en/get-started/quickstart/contributing-to-projects)
- [Docker Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [VS Code DevContainer Documentation](https://code.visualstudio.com/docs/remote/containers)

Thanks for contributing to our project!
