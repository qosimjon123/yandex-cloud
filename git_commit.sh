#!/bin/bash

# Генерируем рандомное число
RANDOM_NUM=$((RANDOM % 10000))

# Получаем информацию об изменениях
CHANGED_FILES=$(git status --short | wc -l)
CHANGED_INFO=$(git status --short | head -5 | awk '{print $2}' | tr '\n' ' ')

# Получаем текущую дату и время
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Формируем сообщение коммита
COMMIT_MSG="Update #$RANDOM_NUM | Changed: $CHANGED_FILES files | Files: $CHANGED_INFO | Time: $DATE"

# Выполняем git операции
echo "Adding files..."
git add *

echo "Committing changes..."
git commit -m "$COMMIT_MSG"

# Получаем хеш коммита после создания
COMMIT_HASH=$(git rev-parse --short HEAD)
echo "Commit hash: $COMMIT_HASH"

echo "Pushing to remote..."
git push

echo "Done! Commit hash: $COMMIT_HASH"

