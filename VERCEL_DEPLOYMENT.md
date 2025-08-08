# 🚀 Деплой проекта на Vercel

## 📋 Подготовка к деплою

### 1. Подготовьте GitHub репозиторий
\`\`\`bash
# Если еще не создан, инициализируйте git
git init
git add .
git commit -m "Initial commit"

# Создайте репозиторий на GitHub и подключите
git remote add origin https://github.com/your-username/telegram-stars-bot.git
git push -u origin main
\`\`\`

### 2. Проверьте файлы проекта
Убедитесь что у вас есть:
- `package.json` ✅
- `next.config.mjs` ✅
- `vercel.json` ✅
- Все исходные файлы ✅

## 🌐 Деплой через Vercel Dashboard

### Шаг 1: Создайте проект
1. Перейдите на https://vercel.com
2. Войдите через GitHub
3. Нажмите **"New Project"**
4. Выберите ваш репозиторий `telegram-stars-bot`
5. Нажмите **"Import"**

### Шаг 2: Настройте проект
1. **Project Name:** `telegram-stars-bot` (или любое другое)
2. **Framework Preset:** Next.js (должно определиться автоматически)
3. **Root Directory:** `.` (корень проекта)
4. **Build Command:** `npm run build` (по умолчанию)
5. **Output Directory:** `.next` (по умолчанию)

### Шаг 3: Добавьте переменные окружения
В разделе **Environment Variables** добавьте:

\`\`\`env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIs...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIs...
TELEGRAM_BOT_TOKEN=123456789:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw
ADMIN_USER_ID=123456789
ADMIN_CHAT_ID=123456789
PAYMENT_KASSA_MERCHANT_ID=your-merchant-id
PAYMENT_KASSA_SECRET_KEY=your-secret-key
PAYMENT_KASSA_API_KEY=your-api-key
PAYMENT_KASSA_TEST_MODE=true
NODE_ENV=production
\`\`\`

### Шаг 4: Деплой
1. Нажмите **"Deploy"**
2. Ждите 2-3 минуты
3. Получите URL: `https://telegram-stars-bot.vercel.app`

## 🔧 Деплой через Vercel CLI

### Установка CLI
\`\`\`bash
npm install -g vercel
\`\`\`

### Логин
\`\`\`bash
vercel login
\`\`\`

### Деплой
\`\`\`bash
# В папке проекта
vercel

# Следуйте инструкциям:
# ? Set up and deploy "~/telegram-stars-bot"? [Y/n] y
# ? Which scope do you want to deploy to? Your Name
# ? Link to existing project? [y/N] n
# ? What's your project's name? telegram-stars-bot
# ? In which directory is your code located? ./
\`\`\`

### Добавление переменных через CLI
\`\`\`bash
# Добавьте каждую переменную
vercel env add NEXT_PUBLIC_SUPABASE_URL
vercel env add NEXT_PUBLIC_SUPABASE_ANON_KEY
vercel env add SUPABASE_SERVICE_ROLE_KEY
vercel env add TELEGRAM_BOT_TOKEN
vercel env add ADMIN_USER_ID
vercel env add ADMIN_CHAT_ID
vercel env add PAYMENT_KASSA_MERCHANT_ID
vercel env add PAYMENT_KASSA_SECRET_KEY
vercel env add PAYMENT_KASSA_API_KEY
vercel env add PAYMENT_KASSA_TEST_MODE

# Или импортируйте из файла
vercel env pull .env.production
\`\`\`

## 🌍 Настройка кастомного домена

### Если у вас есть домен
1. В Vercel Dashboard → Settings → Domains
2. Добавьте ваш домен: `yourdomain.com`
3. Настройте DNS записи у регистратора:
   - **Type:** CNAME
   - **Name:** @ (или www)
   - **Value:** cname.vercel-dns.com

### Если нужен бесплатный домен
Используйте предоставленный Vercel:
\`\`\`
https://telegram-stars-bot.vercel.app
\`\`\`

## 🔄 Обновление переменных окружения

### После деплоя обновите URLs:
\`\`\`env
NEXT_PUBLIC_APP_URL=https://telegram-stars-bot.vercel.app
\`\`\`

### В Vercel Dashboard:
1. Settings → Environment Variables
2. Найдите `NEXT_PUBLIC_APP_URL`
3. Измените на ваш Vercel URL
4. Нажмите **"Save"**
5. Redeploy проект

## 📱 Настройка Telegram webhook

### Автоматически через админ-панель:
1. Перейдите на `https://your-domain.vercel.app/admin/setup`
2. Нажмите **"Настроить webhook"**

### Вручную через API:
\`\`\`bash
curl -X POST "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://telegram-stars-bot.vercel.app/api/webhook/telegram-bot",
    "allowed_updates": ["message", "callback_query", "pre_checkout_query"]
  }'
\`\`\`

## 💳 Настройка Payment Kassa

### В личном кабинете Payment Kassa:
1. **Webhook URL:** `https://telegram-stars-bot.vercel.app/api/webhook/payment-kassa`
2. **Success URL:** `https://telegram-stars-bot.vercel.app/payment/success`
3. **Fail URL:** `https://telegram-stars-bot.vercel.app/payment/fail`

## ✅ Проверка деплоя

### Тестирование:
1. **Основная страница:** `https://your-domain.vercel.app/`
2. **Админ панель:** `https://your-domain.vercel.app/admin`
3. **Тест Supabase:** `https://your-domain.vercel.app/test-supabase`
4. **API здоровья:** `https://your-domain.vercel.app/api/health`

### Проверка webhook:
\`\`\`bash
curl "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getWebhookInfo"
\`\`\`

Ожидаемый ответ:
\`\`\`json
{
  "ok": true,
  "result": {
    "url": "https://telegram-stars-bot.vercel.app/api/webhook/telegram-bot",
    "has_custom_certificate": false,
    "pending_update_count": 0
  }
}
\`\`\`

## 🔄 Автоматические деплои

### Настройка:
1. Каждый push в `main` ветку автоматически деплоится
2. Pull Request создают preview деплои
3. Можно настроить деплой из других веток

### Команды для обновления:
\`\`\`bash
# Внесите изменения
git add .
git commit -m "Update payment system"
git push origin main

# Vercel автоматически деплоит изменения
\`\`\`

## 🚨 Решение проблем

### Ошибка "Build failed"
1. Проверьте логи в Vercel Dashboard
2. Убедитесь что все зависимости в `package.json`
3. Проверьте TypeScript ошибки

### Ошибка "Environment variables"
1. Убедитесь что все переменные добавлены
2. Проверьте что нет опечаток в названиях
3. Redeploy после добавления переменных

### Ошибка "Webhook not working"
1. Проверьте что домен доступен по HTTPS
2. Убедитесь что webhook URL правильный
3. Проверьте логи в Vercel Functions

## 📊 Мониторинг

### Vercel Analytics:
1. Settings → Analytics
2. Включите Web Analytics
3. Мониторьте производительность

### Логи:
1. Functions → View Function Logs
2. Мониторьте API запросы
3. Отслеживайте ошибки

## 💰 Стоимость

### Hobby план (бесплатно):
- 100GB bandwidth
- 100GB-hrs serverless function execution
- Unlimited static deployments

### Pro план ($20/месяц):
- 1TB bandwidth  
- 1000GB-hrs serverless function execution
- Advanced analytics
\`\`\`

Теперь создам API для проверки здоровья системы:
