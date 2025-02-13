echo "Hello! This is test script that checks example.txt availability"
FILE="example.txt"
if [ -f "$FILE" ]; then
    echo "File $FILE found."
else
    echo "File $FILE not found."
fi
echo "Script executed successfully"