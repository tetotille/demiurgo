function add_code_with_indentation --description "Inserta código respetando la indentación de la línea del marcador."
    set file_path $argv[1]
    set marker $argv[2]
    set new_code $argv[3]

    if not test -f "$file_path"
        echo "Error: El archivo '$file_path' no existe." >&2
        return 1
    end

    set tmpfile (mktemp)
    if test -z "$tmpfile"
        echo "Error: No se pudo crear el archivo temporal." >&2
        return 1
    end

    set marker_found false
    while read -l line
        echo "$line" >> "$tmpfile"

        if string contains -- "$marker" "$line"
            # --- INICIO DE LA MAGIA ---

            # 1. Capturar la indentación (espacios/tabs) de la línea actual
            #    - `string match -r` usa expresiones regulares.
            #    - `'^(\s*)'` captura cualquier espacio en blanco desde el inicio de la línea.
            #    - `[2]` obtiene el primer grupo capturado (los espacios).
            set indentation (string match -r '^(\s*)' -- "$line")[2]

            # 2. Aplicar la indentación al nuevo código
            set indented_code "$indentation$new_code"

            # 3. Escribir el código indentado en el archivo temporal
            echo "$indented_code" >> "$tmpfile"

            # --- FIN DE LA MAGIA ---
            set marker_found true
        end
    end < "$file_path"

    if not $marker_found
        echo "Error: Marcador '$marker' no encontrado en '$file_path'." >&2
        rm "$tmpfile"
        return 1
    end

    mv "$tmpfile" "$file_path"
    echo "Código indentado insertado exitosamente en '$file_path'."
end
