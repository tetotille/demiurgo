#!/bin/fish
source api/modules/database/database.fish

function large
    echo -e "¿Qué estructura de proyecto prefiere?\n1.Armored"
    read choice

    if test $choice != 1
        echo "Error: No es una respuesta válida"
        return 1
    end

    echo "¿Qué gestor de base de datos va a usar?"
    echo -e "1.SQLAlchemy\n2.Beanie\n3.Tortoise ORM\n4.Sin base de datos"
    read database_manager

    echo "¿Qué tipo de autenticación tiene en mente?"
    echo -e "1.JWT\n2.Session Based\n3.Oauth2\n4.Sin Autenticación"
    read authentication_type

    echo "¿Quiere algún gestor de tareas asíncronas?"
    echo -e "1.Celery\n2.ARQ\n3.Sin Gestor de Tareas Asíncronas"
    read task_manager

    echo "¿Quiere algún sistema de logging?"
    echo -e "1.Loguru\n2.python-json-logger\n3.Logging estándar de python\n4.Sin logging"
    read logging_system

    echo "¿Qué framework de prueba utilizará?"
    echo -e "1.Pytest\n2.Unittest\n3.Sin Framework de Pruebas"
    read testing_framework

    echo "¿Quiere integrar seguridad adicional?"
    echo -e "1.fastapi-limiter\n2.Protección-CSRF\n3.Ambos\n4.Sin seguridad adicional"
    read security

    create_large_structure $choice $database_manager $authentication_type $task_manager $logging_system
end

function create_large_structure
    set database_manager $argv[2]
    set choice $argv[1]

    switch $choice
        case 1 # Armored
        echo "Creando estructura de carpetas..."
        mkdir -p {core,domain,application,infrastructure}
        mkdir -p domain/{entities,ports}
        mkdir -p application/{services,exceptions}
        mkdir -p infrastructure/{api,persistence,gateways,security}
        mkdir -p infrastructure/api/{routers}
        mkdir -p infrastructure/persistence/{orm_models,repositories}
    end
    database 3 $database_manager $choice

end
