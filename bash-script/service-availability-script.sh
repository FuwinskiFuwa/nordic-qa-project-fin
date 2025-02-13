read -p "Введите URL для проверки: " URL


while true; do
    read -p "Введите количество запросов для проверки: " MAX_RETRIES
    if [[ "$MAX_RETRIES" =~ ^[0-9]+$ ]]; then
        break
    else
        echo "Ошибка: Введите корректное число."
    fi
done

DELAY=2

echo "Ожидайте..."

for ((i=1; i<=MAX_RETRIES; i++)); do
    response=$(curl -o /dev/null -w "%{http_code}" -L --max-time 5 "$URL")

    if [[ "$response" =~ ^2[0-9]{2}$ ]]; then
        echo "Сервис доступен. Код: $response"
		read -p "Скрипт выполнен. Нажмите Enter для выхода..."
        exit 0
    elif [[ "$response" =~ ^3[0-9]{2}$ ]]; then
        echo "Сервис выполняет редирект (код: $response), следуем за ним..."
    else
        echo "Попытка $i/$MAX_RETRIES: сервис недоступен (код: $response). Повторяю..."
        sleep $DELAY
    fi
done

echo "Сервис недоступен после $MAX_RETRIES попыток."

read -p "Скрипт выполнен. Нажмите Enter для выхода..."