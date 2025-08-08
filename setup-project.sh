#!/bin/bash

# Создание структуры проекта Telegram Stars Bot
echo "🚀 Создание проекта Telegram Stars Bot..."

# Создаем основную папку
mkdir telegram-stars-bot
cd telegram-stars-bot

# Создаем структуру папок
mkdir -p app/admin/instructions
mkdir -p app/admin/setup
mkdir -p app/api/admin/approve-payment
mkdir -p app/api/admin/auth
mkdir -p app/api/admin/broadcast
mkdir -p app/api/admin/grant-stars
mkdir -p app/api/admin/payments
mkdir -p app/api/admin/reject-payment
mkdir -p app/api/admin/settings
mkdir -p app/api/admin/setup-webhook
mkdir -p app/api/admin/stats
mkdir -p app/api/admin/users
mkdir -p app/api/payment/card
mkdir -p app/api/payment/confirm-sms
mkdir -p app/api/payment/yookassa
mkdir -p app/api/webhook/telegram-bot
mkdir -p components/ui
mkdir -p lib
mkdir -p scripts

echo "✅ Структура папок создана!"
echo "📝 Теперь создайте файлы из кода выше в соответствующих папках."
