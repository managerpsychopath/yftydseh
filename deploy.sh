#!/bin/bash

echo "🚀 Деплой Telegram Stars Bot на Vercel"

# Проверка что мы в git репозитории
if [ ! -d ".git" ]; then
    echo "❌ Ошибка: Не найден git репозиторий"
    echo "Выполните: git init && git add . && git commit -m 'Initial commit'"
    exit 1
fi

# Проверка что есть изменения для коммита
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Найдены изменения, создаем коммит..."
    git add .
    read -p "Введите сообщение коммита: " commit_message
    git commit -m "$commit_message"
else
    echo "✅ Нет изменений для коммита"
fi

# Пуш в репозиторий
echo "📤 Отправляем изменения в GitHub..."
git push origin main

# Проверка установки Vercel CLI
if ! command -v vercel &> /dev/null; then
    echo "📦 Устанавливаем Vercel CLI..."
    npm install -g vercel
fi

# Деплой на Vercel
echo "🌐 Деплоим на Vercel..."
vercel --prod

echo "✅ Деплой завершен!"
echo "🔗 Проверьте ваш сайт на Vercel Dashboard"
echo "📱 Не забудьте обновить webhook в Telegram и Payment Kassa"
