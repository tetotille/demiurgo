#!/usr/bin/env fish

source package.fish
source api/small/small.fish
source api/large/large.fish
# Welcome to the API Frameworks Generator
# This script will help you scaffold a new API project.

set DEV 1

function main
    if test $DEV = 1
        echo "Running in development mode"
        rm -rf project
    end

    # --- Welcome Message ---
    echo "🚀 Bienvenido al generador de API!"
    echo "Creemos juntos una nueva API para usted."
    echo "------------------------------------------"
    echo ""

    # 1. Ask for project name
    echo "Nombre del proyecto"
    read project_name

    echo "Autor"
    read author_name

    echo "Email"
    read email

    mkdir project
    cd project

    # 2. Ask for API size (small, medium, large)
    echo -e 'Tamaño de la API:\n1.Pequeña\n2.Mediana\n3.Grande'
    read -d , api_size
    switch $api_size
        case "1"
            select_package 2 $project_name $author_name $email
            small
            ;;
        case "2"
            # 3. Ask for technology choices (Poetry vs. pip)
            echo -e "Gestor de paquetes:\n1.Poetry\n2.pip"
            read tech_choice

            select_package $tech_choice $project_name $author_name $email
            medium
            ;;
        case "3"
            select_package 1 $project_name $author_name $email
            large
            ;;
        case *
            echo "Opción Inválida"
            exit 1
            ;;
    end


    # --- Placeholder for future logic ---
    # 1. Ask for project name
    # 2. Ask for API size (small, medium, large)
    # 3. Ask for technology choices (Poetry vs. pip)
    # 4. Ask for components (authentication, database, etc.)
    # 5. Copy templates and generate the project


    # echo "Initialization complete. The generator is ready to be built."
    # echo "Selected: $project_name, $api_size, $tech_choice"
    # echo ""
end

main
