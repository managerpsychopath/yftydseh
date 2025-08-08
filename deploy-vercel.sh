#!/bin/bash

echo "🚀 Деплой Telegram Stars Bot на Vercel"
echo "======================================"

# Проверяем установлен ли Vercel CLI
if ! command -v vercel &> /dev/null; then
    echo "📦 Устанавливаем Vercel CLI..."
    npm install -g vercel
fi

# Проверяем авторизацию
echo "🔐 Проверяем авторизацию..."
if ! vercel whoami &> /dev/null; then
    echo "🔑 Необходима авторизация в Vercel..."
    vercel login
fi

# Деплоим проект
echo "🚀 Деплоим проект..."
vercel --prod

# Получаем URL проекта
PROJECT_URL=$(vercel ls | grep telegram-stars-bot | awk '{print $2}' | head -1)

if [ -z "$PROJECT_URL" ]; then
    echo "❌ Не удалось получить URL проекта"
    exit 1
fi

echo ""
echo "✅ Деплой завершен!"
echo "🌐 URL проекта: https://$PROJECT_URL"
echo ""
echo "📋 Следующие шаги:"
echo "1. Обновите NEXT_PUBLIC_APP_URL в переменных Vercel"
echo "2. Настройте Telegram webhook: https://$PROJECT_URL/admin/setup"
echo "3. Настройте Payment Kassa webhook: https://$PROJECT_URL/api/webhook/payment-kassa"
echo ""
echo "🔗 Полезные ссылки:"
echo "   Админ панель: https://$PROJECT_URL/admin"
echo "   Проверка здоровья: https://$PROJECT_URL/api/health"
echo "   Основное приложение: https://$PROJECT_URL/"
