read -p "Введите путь к входной директории: " input_dir
read -p "Введите путь к выходной директории: " output_dir

if [ ! -d "$input_dir" ]; then
    echo "Входная директория '$input_dir' не существует"
    exit 1
fi

if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
    echo "Создана выходная директория '$output_dir'."
fi


find "$input_dir" -type f | while read -r file; do
    base_name=$(basename "$file")
    dest_file="$output_dir/$base_name"
    if [ -f "$dest_file" ]; then
        echo "Файл с именем $base_name уже существует в выходной директории. Пропускаем копирование."
    else
        cp "$file" "$dest_file"
        echo "Файл $base_name скопирован."
    fi
done

echo "Файлы успешно скопированы в выходную директорию."
