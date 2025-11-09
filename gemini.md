# LLM Guide for "API Frameworks Generator"

## 1. Project Overview

This project is a command-line interface (CLI) tool, written in **Fish script**, designed to scaffold new API projects. Its main purpose is to automate the initial setup of a Python-based API by asking the user a series of questions and generating a project structure based on their answers and a set of predefined templates.

The core script is `create_api.fish`.

## 2. Core Concepts

- **Interactivity:** The tool is interactive. It uses `read` commands in Fish to gather user input for things like the project name, API size, choice of dependency manager, and optional components.
- **Templates:** The project generation is template-based. All the source files and directory structures are stored in the `templates/` directory.
- **Modularity:** The templates are organized by API size (`small`, `medium`, `large`). Each size has a `base` template (the minimum required files) and a `components` directory for optional features (like different authentication methods or database connectors).
- **Extensibility:** The structure is designed to be easily extensible. To add a new option (e.g., a new database ORM), you would simply add a new subdirectory within the appropriate `components` folder and update the main script to present it as an option.

## 3. Directory Structure

```
/frameworks-api/
|
├── create_api.fish         # The main entry point and logic for the generator.
|
├── gemini.md               # This file. Contains instructions for the LLM assistant.
|
├── readme.md               # Public-facing documentation for human users.
|
└── templates/              # Contains all the boilerplate code.
    |
    ├── small/              # For simple APIs, maybe a single file with Flask/FastAPI.
    │   ├── base/           # Core files for a small API.
    │   └── components/     # Optional add-ons for a small API.
    │       └── auth/
    │
    ├── medium/             # For APIs with a structured layout, maybe using Blueprints/Routers.
    │   ├── base/
    │   └── components/
    │       ├── auth/
    │       └── database/
    |
    └── large/              # For complex, enterprise-level APIs with many modules.
        ├── base/
        └── components/
```

- **`create_api.fish`**: This is where all the logic lives. It's responsible for:
    1.  Displaying prompts to the user.
    2.  Reading user input.
    3.  Validating input.
    4.  Based on the input, creating the project directory.
    5.  Copying the correct `base` template.
    6.  Copying the selected `components`.
    7.  (Future) Performing post-generation actions like `git init` or installing dependencies.

- **`templates/`**: This directory holds the building blocks. The files here are plain text and will be copied verbatim to the destination project directory. In the future, they might contain template variables (e.g., `{{PROJECT_NAME}}`) that the script will replace.

## 4. Development Workflow

When asked to add a new feature, follow these steps:

1.  **Understand the Request:** Clarify what the feature is. Is it a new question in the wizard? A new template component? A change in the script's logic?
2.  **Locate Relevant Files:**
    - If it's about the interactive process, you'll likely edit `create_api.fish`.
    - If it's about the code being generated, you'll be adding or modifying files inside the `templates/` directory.
3.  **Modify `create_api.fish`:**
    - Add a new function for the new prompt (e.g., `ask_for_database`).
    - Use `read` with appropriate flags (`-P` for prompt, `-l` for local scope) to get user input.
    - Add logic (e.g., `if/else` or `switch`) to handle the user's choice.
    - Add the commands to copy the relevant template files (`cp -r`).
4.  **Add/Modify Templates:**
    - Create the new files or directories under the appropriate `templates/` path. For example, if adding a Redis component for a medium-sized API, you might create `templates/medium/components/caching/redis/`.
5.  **Test (Conceptual):** Mentally walk through the script's execution. Ensure the new logic fits correctly and that the right files will be copied to the right places. Announce your changes clearly to the user.

## 5. Current Project State

The project has its basic directory structure and an empty `create_api.fish` script. The immediate next steps are to implement the initial user prompts for project name and API size.