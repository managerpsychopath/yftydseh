# 🔧 Настройка Webhook для Telegram Bot

## 📋 Что такое Webhook?

Webhook - это URL-адрес, на который Telegram отправляет обновления (сообщения, нажатия кнопок, платежи) вашему боту в реальном времени.

## 🌐 Webhook URL в проекте:

### 1. **TELEGRAM_WEBHOOK_URL** 
\`\`\`
https://your-domain.com/api/webhook/telegram
\`\`\`
**Назначение:** Обработка платежей Telegram Stars
- Получает уведомления об успешных платежах
- Обрабатывает pre-checkout запросы
- Начисляет звёзды пользователям

### 2. **TELEGRAM_BOT_WEBHOOK_URL**
\`\`\`
https://your-domain.com/api/webhook/telegram-bot
\`\`\`
**Назначение:** Обработка кнопок админ-панели
- Обрабатывает нажатия кнопок "Подтвердить/Отклонить"
- Управляет статусами платежей
- Отправляет уведомления админу

## ⚙️ Как настроить Webhook:

### Вариант 1: Через BotFather (рекомендуется)
1. Откройте чат с @BotFather
2. Отправьте `/setwebhook`
3. Выберите вашего бота
4. Отправьте URL: `https://your-domain.com/api/webhook/telegram-bot`

### Вариант 2: Через API Telegram
\`\`\`bash
curl -X POST "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook" \
     -H "Content-Type: application/json" \
     -d '{
       "url": "https://your-domain.com/api/webhook/telegram-bot",
       "allowed_updates": ["message", "callback_query", "pre_checkout_query"]
     }'
\`\`\`

### Вариант 3: Через админ-панель
1. Перейдите на `/admin/setup`
2. Нажмите "Настроить webhook"
3. Система автоматически настроит webhook

## 🔍 Проверка настройки:

### Проверить текущий webhook:
\`\`\`bash
curl "https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getWebhookInfo"
\`\`\`

### Ответ должен содержать:
\`\`\`json
{
  "ok": true,
  "result": {
    "url": "https://your-domain.com/api/webhook/telegram-bot",
    "has_custom_certificate": false,
    "pending_update_count": 0
  }
}
\`\`\`

## 🚨 Важные моменты:

1. **HTTPS обязателен** - Telegram принимает только HTTPS webhook
2. **Один webhook на бота** - можно установить только один URL
3. **Порт должен быть стандартным** - 80, 88, 443, 8443
4. **Сертификат должен быть валидным** - самоподписанные не подойдут

## 🔧 Переменные окружения:

\`\`\`env
# Основные
TELEGRAM_BOT_TOKEN=your_bot_token_here
ADMIN_CHAT_ID=your_admin_chat_id_for_logs
ADMIN_USER_ID=your_admin_user_id_for_panel_access
NEXT_PUBLIC_APP_URL=https://your-domain.com

# Webhook URLs (для справки)
TELEGRAM_WEBHOOK_URL=https://your-domain.com/api/webhook/telegram
TELEGRAM_BOT_WEBHOOK_URL=https://your-domain.com/api/webhook/telegram-bot
\`\`\`

## 🐛 Отладка:

### Если webhook не работает:
1. Проверьте логи Vercel/сервера
2. Убедитесь, что домен доступен по HTTPS
3. Проверьте переменные окружения
4. Используйте `/admin/setup` для диагностики

### Тестирование:
1. Создайте тестовый платёж
2. Нажмите кнопки в админ-панели
3. Проверьте логи в консоли браузера и сервера
\`\`\`

Теперь обновлю страницу настройки админ-панели:
