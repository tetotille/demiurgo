#!/usr/bin/env fish

source package.fish
source api/small/small.fish
# Welcome to the API Frameworks Generator
# This script will help you scaffold a new API project.

function main

    # --- Welcome Message ---
    echo "🚀 Welcome to the API Frameworks Generator!"
    echo "Let's set up a new API project for you."
    echo "------------------------------------------"
    echo ""

    # 1. Ask for project name
    echo "Project Name"
    read project_name

    echo "Author"
    read author_name

    echo "Email"
    read email

    mkdir project
    cd project

    # 3. Ask for technology choices (Poetry vs. pip)
    echo -e "Technology Choice:\n1.Poetry\n2.pip"
    read tech_choice

    select_package $tech_choice $project_name $author_name $email

    # 2. Ask for API size (small, medium, large)
    echo -e 'API Size:\n1.Small\n2.Medium\n3.Large'
    read -d , api_size
    switch $api_size
        case "1"
            small
            ;;
        case "2"
            medium
            ;;
        case "3"
            large
            ;;
        case *
            echo "Invalid choice"
            exit 1
            ;;
    end


    # --- Placeholder for future logic ---
    # 1. Ask for project name
    # 2. Ask for API size (small, medium, large)
    # 3. Ask for technology choices (Poetry vs. pip)
    # 4. Ask for components (authentication, database, etc.)
    # 5. Copy templates and generate the project


    echo "Initialization complete. The generator is ready to be built."
    echo "Selected: $project_name, $api_size, $tech_choice"
    echo ""
end

main
