SCRIPT_FILE="test-script.sh"
bash -n "$SCRIPT_FILE"

if [ $? -eq 0 ]; then
    echo "Синтаксис скрипта $SCRIPT_FILE в порядке."
else
    echo "Ошибка: Синтаксис скрипта $SCRIPT_FILE содержит ошибки или файл не найден."
    exit 1
fi