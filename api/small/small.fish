#!/bin/fish

function small
    echo -e "What type of small project?\n1.Prototype or POC\n2.Lightweight Microservice
3.Application with a bit of endpoints\n4.Internal tools"
    read choice
    create_structure $choice

end

function create_structure
    echo "Creating structure..."
    set choice $argv[1]
    switch $choice
        case 1
            echo "Creating prototype..."
            cat ../api/small/templates/prototype/app.py >> app.py

        case 2
            echo "Creating lightweight microservice..."
            touch app.py
            touch db.py
            touch models.py
        case 3
            echo "Creating application with endpoints..."
            touch main.py
            mkdir api
            touch api/routes.py
            touch api/__init__.py

        case 4
            echo "Creating internal tools..."
            touch main.py
            mkdir src
            touch src/__init__.py
            touch src/app.py
            touch src/service.py
            touch src/api.py

        case *
            echo "Invalid choice"
    end

end
