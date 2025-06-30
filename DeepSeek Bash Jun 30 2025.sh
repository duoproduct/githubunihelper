#!/bin/bash

# Конфигурация (ваши данные)
TOKEN="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"
USER="duoproduct"
REPO_NAME="githubunihelper"
PROJECT_DIR="/Users/alexcreme/Documents/Extensions Development/KaitenUniHelper"

# Переходим в директорию проекта
cd "$PROJECT_DIR"

# Инициализируем Git-репозиторий
git init
git branch -M main

# Добавляем все файлы (кроме указанных в .gitignore)
git add .

# Создаем коммит
git commit -m "Initial commit: Safari Extension project"

# Создаем репозиторий через GitHub API
API_URL="https://api.github.com/user/repos"
curl -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -d '{
        "name": "'"$REPO_NAME"'",
        "private": true,
        "auto_init": false
      }' \
  $API_URL

# Добавляем удаленный репозиторий
git remote add origin "https://$USER:$TOKEN@github.com/$USER/$REPO_NAME.git"

# Пушим изменения
git push -u origin main

# Убираем токен из конфигурации (для безопасности)
git remote set-url origin "https://github.com/$USER/$REPO_NAME.git"

echo ""
echo "✅ Репозиторий успешно создан и код отправлен!"
echo "🔗 Ссылка: https://github.com/$USER/$REPO_NAME"