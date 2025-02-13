LOG_FILE="/path/to/log/file.log"
ERROR_KEYWORDS=("ERROR" "FAILED" "CRITICAL")
for keyword in "${ERROR_KEYWORDS[@]}"; do
    echo "Поиск по ключевому слову: $keyword"
    grep -i $keyword $LOG_FILE
done