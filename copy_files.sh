read -p "Введите путь к входной директории: " input_dir
read -p "Введите путь к выходной директории: " output_dir
if [ ! -d "$input_dir" ]; then
    echo "Входная директория '$input_dir' не существует"
    exit 1
fi
if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
fi
files_recursive=$(find "$input_dir" -type f)
for file in $files_recursive; do
        base_name=$(basename "$file")
        dest_file="$output_dir/$base_name"
        if [ -f "$dest_file" ]; then
             echo "Файл с именем $base_name уже существует в выходной директории. Пропускаем копирование."
        else
                cp "$file" "$output_dir"
        fi
done
echo "Файлы успешно скопированы в выходную директорию"
