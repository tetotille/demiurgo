function database
    set type $argv[1]
    set database_manager $argv[2]
    set choice $argv[3]

    switch $type
        case 1 # Corresponde a tipo small
            echo "Database tipo pequeño: falta implementar"
        case 2 # Corresponde a tipo medium
            echo "Database tipo medio: falta implementar"
        case 3 # Corresponde a tipo large
            switch $choice
                case 1 # Corresponde a la estructura blindada
                    set settings "core/settings.py"
                    set database_file "infrastructure/persistence/database.py"
                    set orm_model_example "infrastructure/persistence/orm_models/example_model.py"
                    set dependency_injection "core/dependency.py"
                    switch $database_manager
                    case 1 # Corresponde a SQLAlchemy con ORM
                        poetry add sqlalchemy[asyncio] alembic aiosqlite
                        cat ../api/modules/database/orm/settings.py >> $settings
                        echo "from core.settings import settings" > $database_file
                        cat ../api/modules/database/orm/database.py >> $database_file
                        echo "from infrastructure.persistence.database import Base" > $orm_model_example
                        cat ../api/modules/database/orm/example_model.py >> $orm_model_example
                        echo "from infrastructure.persistence.database import AsyncSessionLocal" > $dependency_injection
                        cat ../api/modules/database/orm/dependency.py >> $dependency_injection
                    case 2 # Corresponde a un ODM con Beany
                        echo "Database tipo large con ODM y Beany: falta implementar"
                    end
            end

    end
end
