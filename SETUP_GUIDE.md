# 🚀 Полная инструкция по настройке Telegram Stars Bot

## 📋 Что нужно получить

### 1. 🗄️ Supabase (ОБЯЗАТЕЛЬНО)
1. Перейдите на https://supabase.com
2. Создайте новый проект
3. Перейдите в Settings → API
4. Скопируйте:
   - **Project URL**: `https://abcdefghijklmnop.supabase.co`
   - **Anon key**: `eyJhbGciOiJIUzI1NiIs...` (публичный ключ)
   - **Service role key**: `eyJhbGciOiJIUzI1NiIs...` (секретный ключ)

### 2. 🤖 Telegram Bot (ОБЯЗАТЕЛЬНО)
1. Найдите **@BotFather** в Telegram
2. Отправьте `/newbot`
3. Введите название и username бота
4. Скопируйте **Bot Token**: `123456789:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw`

### 3. 🆔 Ваш Telegram ID (ОБЯЗАТЕЛЬНО)
**Способ 1 (рекомендуется):**
- Найдите **@userinfobot** в Telegram
- Отправьте любое сообщение
- Получите ваш **User ID**: `123456789`

**Способ 2:**
- Найдите **@getmyid_bot** в Telegram
- Нажмите `/start`
- Получите **User ID**

### 4. 💬 Chat ID для логов (ОБЯЗАТЕЛЬНО)
- **Для личных сообщений**: используйте тот же ID что и User ID
- **Для группы**: создайте группу, добавьте бота, получите Chat ID

## 🔧 Настройка .env файла

Создайте файл `.env.local` и заполните:

\`\`\`env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key-here

# Telegram
TELEGRAM_BOT_TOKEN=your-telegram-bot-token-here
ADMIN_USER_ID=your-admin-user-id-here
ADMIN_CHAT_ID=your-admin-chat-id-here

# App
NEXT_PUBLIC_APP_URL=http://localhost:3000
NODE_ENV=development
\`\`\`

## ❌ НЕ НУЖНО заполнять

Эти переменные **НЕ ИСПОЛЬЗУЮТСЯ** в проекте:

\`\`\`env
# ❌ НЕ НУЖНО - проект не использует NextAuth
NEXTAUTH_SECRET=...
NEXTAUTH_URL=...

# ❌ НЕ НУЖНО - используется Supabase, а не прямое подключение к Postgres
POSTGRES_URL=...
POSTGRES_USER=...
POSTGRES_PASSWORD=...
\`\`\`

## 🚀 Запуск проекта

1. **Установите зависимости:**
   \`\`\`bash
   npm install
   \`\`\`

2. **Настройте базу данных:**
   - Перейдите в Supabase → SQL Editor
   - Выполните скрипт `scripts/create-database.sql`

3. **Запустите проект:**
   \`\`\`bash
   npm run dev
   \`\`\`

4. **Проверьте подключения:**
   - Откройте http://localhost:3000/test-supabase
   - Все тесты должны быть зелёными ✅

5. **Настройте webhook:**
   - Перейдите на http://localhost:3000/admin/setup
   - Нажмите "Настроить webhook"

## 🔐 NextAuth (если понадобится)

Если в будущем захотите добавить NextAuth:

1. **Сгенерируйте секрет:**
   - Перейдите на `/generate-secret`
   - Или используйте: `openssl rand -base64 32`

2. **Добавьте в .env:**
   \`\`\`env
   NEXTAUTH_SECRET=your-generated-secret
   NEXTAUTH_URL=http://localhost:3000
   \`\`\`

## 📱 Тестирование

1. **Проверьте Supabase:** `/test-supabase`
2. **Получите Telegram ID:** `/get-telegram-id`
3. **Админ панель:** `/admin`
4. **Основное приложение:** `/`

## 🆘 Помощь

Если что-то не работает:
1. Проверьте все переменные в `.env.local`
2. Убедитесь что база данных создана
3. Проверьте что бот создан через @BotFather
4. Проверьте что webhook настроен
