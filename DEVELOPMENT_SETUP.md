# Настройка для разработки без домена

## 🚀 Варианты для разработки

### 1. Использование ngrok (Рекомендуется)

**Установка ngrok:**
\`\`\`bash
# Скачайте с https://ngrok.com/download
# Или через npm
npm install -g ngrok

# Или через brew (macOS)
brew install ngrok
\`\`\`

**Запуск:**
\`\`\`bash
# В одном терминале запустите проект
npm run dev

# В другом терминале запустите ngrok
ngrok http 3000
\`\`\`

**Получите URL:**
\`\`\`
https://abc123.ngrok.io
\`\`\`

**Обновите .env:**
\`\`\`env
NEXT_PUBLIC_APP_URL=https://abc123.ngrok.io
PAYMENT_KASSA_WEBHOOK_URL=https://abc123.ngrok.io/api/webhook/payment-kassa
\`\`\`

### 2. Быстрый деплой на Vercel

**Установка Vercel CLI:**
\`\`\`bash
npm install -g vercel
\`\`\`

**Деплой:**
\`\`\`bash
# В папке проекта
vercel

# Следуйте инструкциям
# Получите URL: https://your-project.vercel.app
\`\`\`

**Настройте переменные окружения в Vercel:**
1. Перейдите в проект на vercel.com
2. Settings → Environment Variables
3. Добавьте все переменные из .env

### 3. Использование Railway

**Деплой на Railway:**
1. Перейдите на https://railway.app
2. Подключите GitHub репозиторий
3. Настройте переменные окружения
4. Получите домен: https://your-project.railway.app

### 4. Использование Render

**Деплой на Render:**
1. Перейдите на https://render.com
2. Создайте Web Service из GitHub
3. Настройте переменные окружения
4. Получите домен: https://your-project.onrender.com

## 🔧 Настройка Payment Kassa для разработки

### Временный домен для регистрации:
1. Используйте любой из вариантов выше
2. Зарегистрируйтесь в Payment Kassa с временным доменом
3. Укажите webhook URL: `https://your-temp-domain.com/api/webhook/payment-kassa`

### Тестовый режим:
\`\`\`env
PAYMENT_KASSA_TEST_MODE=true
\`\`\`

В тестовом режиме Payment Kassa менее строго относится к доменам.

## 📱 Настройка Telegram бота

**Webhook для бота:**
\`\`\`bash
# Через curl
curl -X POST "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook" \
  -H "Content-Type: application/json" \
  -d '{"url": "https://your-domain.com/api/webhook/telegram-bot"}'

# Или через браузер
https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook?url=https://your-domain.com/api/webhook/telegram-bot
\`\`\`

## 🧪 Тестирование

### Проверка webhook:
1. Создайте тестовый платёж
2. Проверьте логи в консоли
3. Убедитесь что webhook получен

### Тестовые данные Payment Kassa:
- **Карта:** 4111 1111 1111 1111
- **Срок:** любой будущий
- **CVV:** любой 3-значный

## ⚡ Быстрый старт с ngrok

\`\`\`bash
# 1. Установите зависимости
npm install

# 2. Скопируйте .env
cp .env .env.local

# 3. Запустите проект
npm run dev

# 4. В новом терминале
ngrok http 3000

# 5. Скопируйте ngrok URL в .env.local
NEXT_PUBLIC_APP_URL=https://abc123.ngrok.io

# 6. Зарегистрируйтесь в Payment Kassa с этим URL
\`\`\`

## 🔄 Обновление webhook при смене URL

Если URL изменился (например, новая ngrok сессия):

1. **Обновите .env.local**
2. **Обновите webhook в Payment Kassa**
3. **Обновите webhook Telegram бота**
4. **Перезапустите проект**

## 💡 Советы

1. **ngrok бесплатно** предоставляет временные URL
2. **Vercel/Railway** дают постоянные домены
3. **Тестовый режим** Payment Kassa работает с любыми доменами
4. **Сохраните ngrok URL** - он действует до перезапуска
