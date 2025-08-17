# Security Policy

## Reporting a Vulnerability

We take security vulnerabilities seriously. Thanks for helping us keep this project secure by responsibly disclosing any issues you find.

### How to Report a Security Issue

If you think you've found a security vulnerability, here's what to do:

1. **Don't** post it publicly (no GitHub issues, discussions, or PRs please).
2. Use GitHub's [Private Vulnerability Reporting](https://github.com/izykitten/devcontainer/security/policy) feature to report it securely.
3. Give us time to fix the issue before making it public.

### What to Include in Your Report

When reporting a vulnerability, please include:

- Clear description of the vulnerability and its potential impact
- Steps to reproduce the issue
- Proof-of-concept code if you have it
- Suggestions for fixes if you have ideas
- Your contact info for follow-up questions

### What to Expect

When you submit a vulnerability report:

1. We'll acknowledge your report within 48 hours
2. We'll assess the validity and severity of the issue
3. We'll keep you updated on our progress
4. We'll give you public credit for the disclosure (if you want it)

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| base    | :white_check_mark: |

## Security Best Practices for Contributors

If you're contributing, please follow these security practices:

1. **Dependencies**: Only use necessary dependencies and keep them updated
2. **Code Review**: All changes go through review before merging
3. **Container Security**:
   - Use least privilege principles in Dockerfiles
   - Keep base images updated
   - Don't bake sensitive info into images
4. **Environment Variables**: Never commit secrets or sensitive environment variables
5. **Shell Scripts**: Make sure all shell scripts validate inputs properly

## Security Updates

We'll document security updates in our release notes. Critical patches get released ASAP.

## Security Tips for Users

When using this devcontainer:

1. Review any changes to setup scripts before using them
2. Be careful when adding new software or dependencies
3. Check the Dockerfiles for potential security issues
4. Make sure any mounted volumes have proper permissions

Thanks for helping keep this project secure!
