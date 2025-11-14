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
                        # Lógica para Beanie ODM
                        set odm_model_dir "infrastructure/persistence/odm_models"
                        set odm_model_example "$odm_model_dir/example_model.py"

                        echo "Creando directorio para modelos ODM..."
                        mkdir -p $odm_model_dir

                        echo "Instalando Beanie y Motor..."
                        poetry add beanie motor

                        echo "Creando archivos de configuración y base de datos..."
                        cat ../api/modules/database/odm/settings.py >> $settings

                        echo "from core.settings import settings" > $database_file
                        # Corregir la ruta de importación para que sea relativa al proyecto
                        set import_path (string replace -r "infrastructure/persistence/" "" $odm_model_dir)
                        echo "from infrastructure.persistence.odm_models.example_model import ExampleModel" >> $database_file
                        cat ../api/modules/database/odm/database.py >> $database_file

                        echo "Creando modelo de ejemplo..."
                        cat ../api/modules/database/odm/example_model.py >> $odm_model_example

                        echo "Nota: Beanie no requiere una dependencia por petición como SQLAlchemy."
                        echo "Asegúrate de llamar a la función 'init_db()' en el evento de startup de tu aplicación FastAPI."
                    case 3 # Corresponde a Tortoise ORM
                        set orm_model_dir "infrastructure/persistence/orm_models"
                        set orm_model_example "$orm_model_dir/example_model.py"

                        echo "Instalando Tortoise-ORM, Aerich y aiosqlite..."
                        poetry add tortoise-orm aerich aiosqlite

                        echo "Creando archivos de configuración y base de datos..."
                        cat ../api/modules/database/tortoise/settings.py >> $settings

                        echo "from core.settings import settings" > $database_file
                        cat ../api/modules/database/tortoise/database.py >> $database_file

                        echo "Creando modelo de ejemplo..."
                        # El directorio orm_models ya fue creado por el caso de SQLAlchemy,
                        # pero nos aseguramos por si se ejecuta de forma aislada.
                        mkdir -p $orm_model_dir
                        cat ../api/modules/database/tortoise/example_model.py >> $orm_model_example

                        echo "Configurando Aerich para migraciones en pyproject.toml..."
                        echo '' >> pyproject.toml
                        echo '[tool.aerich]' >> pyproject.toml
                        echo 'tortoise_orm = "infrastructure.persistence.database.TORTOISE_ORM_CONFIG"' >> pyproject.toml
                        echo 'location = "./migrations"' >> pyproject.toml
                        echo 'src_folder = "."' >> pyproject.toml

                        echo "Nota: Tortoise-ORM, al igual que Beanie, no requiere una dependencia por petición."
                        echo "Asegúrate de llamar a la función 'init_db()' en el evento de startup de tu aplicación FastAPI."
                    case 4 # Sin base de datos
                        echo "Creando archivo de configuración base (sin base de datos)..."
                        cat ../api/modules/database/no_db/settings.py >> $settings
                        echo "Configuración base creada en core/settings.py."
                    end
            end

    end
end
