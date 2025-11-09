#!/bin/fish

function select_package
    set selected $argv[1]

    switch $selected
        case "1"
            echo "Poetry"
            pip install poetry

            poetry init -q --name=$argv[2] --author=$argv[3] -n

        case "2"
            echo "pip"
            touch requirements.txt

        case "*"
            echo "Invalid choice"
            exit 1
    end
end
