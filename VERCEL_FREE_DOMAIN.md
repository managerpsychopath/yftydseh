# 🆓 Бесплатный домен от Vercel

## 🌐 Что предоставляет Vercel бесплатно

Vercel автоматически дает каждому проекту бесплатный домен:
\`\`\`
https://your-project-name.vercel.app
\`\`\`

## 🚀 Как получить бесплатный домен

### 1. Деплой проекта на Vercel

\`\`\`bash
# Установите Vercel CLI
npm install -g vercel

# В папке проекта
vercel

# Следуйте инструкциям:
# ? What's your project's name? telegram-stars-bot
# ? In which directory is your code located? ./
\`\`\`

### 2. Получите автоматический домен

После деплоя вы получите:
\`\`\`
https://telegram-stars-bot.vercel.app
\`\`\`

### 3. Кастомизация имени

Можете изменить имя проекта:
- В Vercel Dashboard → Settings → General
- Измените "Project Name"
- Новый домен: `https://new-name.vercel.app`

## ⚙️ Настройка проекта

### Обновите переменные окружения:

\`\`\`env
NEXT_PUBLIC_APP_URL=https://telegram-stars-bot.vercel.app
NODE_ENV=production
\`\`\`

### В Vercel Dashboard:
1. Settings → Environment Variables
2. Обновите `NEXT_PUBLIC_APP_URL`
3. Нажмите "Redeploy"

## 📱 Настройка Telegram webhook

### Автоматически:
Перейдите на: `https://telegram-stars-bot.vercel.app/admin/setup`

### Вручную:
\`\`\`bash
curl -X POST "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook" \
     -H "Content-Type: application/json" \
     -d '{
       "url": "https://telegram-stars-bot.vercel.app/api/webhook/telegram-bot"
     }'
\`\`\`

## 💳 Настройка Payment Kassa

В личном кабинете Payment Kassa укажите:
- **Success URL:** `https://telegram-stars-bot.vercel.app/payment/success`
- **Fail URL:** `https://telegram-stars-bot.vercel.app/payment/fail`
- **Webhook URL:** `https://telegram-stars-bot.vercel.app/api/webhook/payment-kassa`

## ✅ Проверка работы

### Основные страницы:
- **Главная:** https://telegram-stars-bot.vercel.app/
- **Админ:** https://telegram-stars-bot.vercel.app/admin
- **Здоровье:** https://telegram-stars-bot.vercel.app/api/health

### Проверка webhook:
\`\`\`bash
curl "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getWebhookInfo"
\`\`\`

## 🔄 Автоматические обновления

- Каждый push в main ветку → автоматический деплой
- Домен остается тем же
- SSL сертификат обновляется автоматически

## 🎯 Преимущества бесплатного домена Vercel

✅ **Бесплатно навсегда**
✅ **SSL сертификат включен**
✅ **Global CDN**
✅ **Автоматические обновления**
✅ **Высокая скорость**
✅ **99.99% uptime**

## 📊 Ограничения Hobby плана

- 100GB bandwidth/месяц
- 100GB-hrs serverless functions
- Unlimited static deployments
- Community support

Для большинства Telegram ботов этого более чем достаточно!
\`\`\`

Обновлю .env файл с примером Vercel домена:

```plaintext file=".env"
# ===========================================
# SUPABASE CONFIGURATION (ОБЯЗАТЕЛЬНО)
# ===========================================
# Получите эти данные на https://supabase.com
# Перейдите в ваш проект → Settings → API

# Project URL - URL вашего проекта Supabase
NEXT_PUBLIC_SUPABASE_URL=https://isqmfkadokyjqyxcyuxr.supabase.co

# Anon/Public Key - публичный ключ для клиентских запросов
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzcW1ma2Fkb2t5anF5eGN5dXhyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQzOTQ2NTcsImV4cCI6MjA2OTk3MDY1N30.GJH2lUBnORNy-D1IIcgvFvQuvCmZ2oSdMkrIwQVWROc

# Service Role Key - секретный ключ для серверных операций
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzcW1ma2Fkb2t5anF5eGN5dXhyIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1NDM5NDY1NywiZXhwIjoyMDY5OTcwNjU3fQ.HPOX0nOHrNt-J-K-dOgXFV8Qn1O7T6KGTlrScW9CsjE

# ===========================================
# TELEGRAM BOT CONFIGURATION (ОБЯЗАТЕЛЬНО)
# ===========================================
# Получите через @BotFather в Telegram

# Bot Token - токен вашего бота
TELEGRAM_BOT_TOKEN=8268066408:AAHG4PIZFW72D4XuDelr5TrEKMr_8dFXOx8

# Admin User ID - ваш Telegram User ID для доступа к админ-панели
ADMIN_USER_ID=7226951667

# Admin Chat ID - ID чата для логов
ADMIN_CHAT_ID=-1002830116454

# ===========================================
# APPLICATION SETTINGS (ОБЯЗАТЕЛЬНО)
# ===========================================

# App URL - URL вашего приложения
# Локально: http://localhost:3000
# Vercel: https://telegram-stars-bot.vercel.app
NEXT_PUBLIC_APP_URL=https://telegram-stars-bot.vercel.app

# Environment
NODE_ENV=production

# ===========================================
# PAYMENT KASSA CONFIGURATION (ОБЯЗАТЕЛЬНО)
# ===========================================
# Получите эти данные в личном кабинете Payment Kassa

# Merchant ID - ID вашего магазина
PAYMENT_KASSA_MERCHANT_ID=your-merchant-id-here

# Secret Key - секретный ключ для подписи запросов
PAYMENT_KASSA_SECRET_KEY=your-secret-key-here

# API Key - ключ для API запросов
PAYMENT_KASSA_API_KEY=your-api-key-here

# Test Mode - режим тестирования (true/false)
PAYMENT_KASSA_TEST_MODE=true
