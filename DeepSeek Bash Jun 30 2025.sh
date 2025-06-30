#!/bin/bash

# Конфигурация
TOKEN="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"
USER="duoproduct"
REPO_NAME="githubunihelper"
PROJECT_DIR="/Users/alexcreme/Documents/Extensions Development/KaitenUniHelper"

# Переходим в директорию проекта
cd "$PROJECT_DIR"

# Инициализируем Git (если не инициализирован)
if [ ! -d .git ]; then
    git init
    git branch -M main
fi

# Удаляем существующий origin
git remote remove origin 2> /dev/null

# Добавляем все файлы
git add .

# Создаем коммит (если есть изменения)
if [ -n "$(git status --porcelain)" ]; then
    git commit -m "Update: $(date +'%Y-%m-%d %H:%M:%S')"
fi

# Устанавливаем правильный URL репозитория с токеном
REPO_URL="https://$USER:$TOKEN@github.com/$USER/$REPO_NAME.git"

# Принудительно пушим изменения
git push -f "$REPO_URL" main

# Устанавливаем постоянный remote без токена
git remote add origin "https://github.com/$USER/$REPO_NAME.git"

echo ""
echo "========================================"
echo "✅ Код успешно отправлен в репозиторий!"
echo "🔗 Ссылка: https://github.com/$USER/$REPO_NAME"
echo "========================================"
