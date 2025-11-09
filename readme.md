# API Frameworks Generator

A simple, powerful, and extensible CLI tool for scaffolding new API projects.

This generator helps you kickstart your next Python-based API in seconds, creating a complete project structure based on your choices.

## Features

- **Interactive Setup**: An easy-to-use wizard guides you through the setup process.
- **Multiple Sizes**: Choose from `small`, `medium`, or `large` API templates, tailored for different project scales.
- **Customizable Components**: Select optional components to include, such as:
  - Dependency Management (`Poetry`, `pip`)
  - Authentication (`Basic Auth`, `JWT`, `OAuth2`)
  - Database ORMs (`SQLAlchemy`, `Tortoise ORM`)
- **Built with Fish**: The core script is written in modern, user-friendly [Fish shell](https://fishshell.com/).

## Getting Started

### Prerequisites

- [Fish Shell](https://fishshell.com/) installed on your system.

### Usage

1.  Make the script executable:
    ```fish
    chmod +x create_api.fish
    ```

2.  Run the script:
    ```fish
    ./create_api.fish
    ```

3.  Follow the on-screen prompts to configure and generate your new API project. The project will be created in a new directory in your current location.

## Project Structure

The generator uses a modular template system located in the `templates/` directory. This makes it easy to add new components or even entirely new API sizes.

```
/
├── create_api.fish     # The main script
└── templates/          # All the boilerplate code
    ├── small/
    ├── medium/
    └── large/
```

## Contributing

Contributions are welcome! If you have an idea for a new feature or a template improvement, feel free to open an issue or submit a pull request.