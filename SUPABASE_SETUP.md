# 🗄️ Настройка Supabase для Telegram Stars Bot

## ❌ НЕ НУЖНО заполнять эти переменные для Supabase:

\`\`\`env
# ❌ Эти переменные НЕ НУЖНЫ для Supabase!
POSTGRES_URL=postgresql://user:password@host:port/database
POSTGRES_PRISMA_URL=postgresql://user:password@host:port/database?pgbouncer=true&connect_timeout=15
POSTGRES_URL_NON_POOLING=postgresql://user:password@host:port/database
POSTGRES_USER=your-postgres-user
POSTGRES_PASSWORD=your-postgres-password
POSTGRES_DATABASE=your-database-name
POSTGRES_HOST=your-postgres-host
SUPABASE_JWT_SECRET=your-jwt-secret-here
SUPABASE_ANON_KEY=your-anon-key-here
\`\`\`

**Почему не нужно?**
- Supabase предоставляет свой собственный API
- Мы используем Supabase SDK, а не прямое подключение к PostgreSQL
- Все операции с БД идут через Supabase REST API

## ✅ НУЖНО заполнить только эти переменные:

### 1. Supabase переменные (ОБЯЗАТЕЛЬНО):
\`\`\`env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIs...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIs...
\`\`\`

### 2. Telegram переменные (ОБЯЗАТЕЛЬНО):
\`\`\`env
TELEGRAM_BOT_TOKEN=123456789:AAH...
ADMIN_USER_ID=123456789
ADMIN_CHAT_ID=123456789
\`\`\`

### 3. App переменные (ОБЯЗАТЕЛЬНО):
\`\`\`env
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret-here
\`\`\`

## 📋 Пошаговая инструкция:

### Шаг 1: Создание проекта Supabase
1. Перейдите на https://supabase.com
2. Нажмите "Start your project"
3. Войдите через GitHub
4. Нажмите "New Project"
5. Заполните:
   - **Name:** `telegram-stars-bot`
   - **Database Password:** Придумайте пароль (запомните его!)
   - **Region:** Выберите ближайший к вам
6. Нажмите "Create new project"
7. Ждите 2-3 минуты пока проект создается

### Шаг 2: Получение API ключей
1. В вашем проекте перейдите в **Settings** (⚙️)
2. Выберите **API** в левом меню
3. Скопируйте данные:

**Project URL:**
\`\`\`
https://abcdefghijklmnop.supabase.co
\`\`\`
Вставьте в `NEXT_PUBLIC_SUPABASE_URL`

**anon public key:**
\`\`\`
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTY5...
\`\`\`
Вставьте в `NEXT_PUBLIC_SUPABASE_ANON_KEY`

**service_role secret key:**
\`\`\`
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoic2VydmljZV9yb2xlIiwiaWF0Ijo...
\`\`\`
Вставьте в `SUPABASE_SERVICE_ROLE_KEY`

### Шаг 3: Создание таблиц
1. Перейдите в **SQL Editor**
2. Скопируйте содержимое файла `scripts/create-database.sql`
3. Вставьте в редактор и нажмите **Run**

Или используйте **Table Editor** для создания таблиц вручную.

### Шаг 4: Проверка подключения
1. Запустите проект: `npm run dev`
2. Перейдите на http://localhost:3000/test-supabase
3. Все тесты должны быть зелёными ✅

## 🔍 Проверка настройки:

### Минимальный .env файл:
\`\`\`env
# Supabase
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIs...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIs...

# Telegram
TELEGRAM_BOT_TOKEN=123456789:AAH...
ADMIN_USER_ID=123456789
ADMIN_CHAT_ID=123456789

# App
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret
NODE_ENV=development
\`\`\`

## ❓ Часто задаваемые вопросы:

**Q: Нужно ли заполнять POSTGRES_* переменные?**
A: НЕТ! Эти переменные нужны только для прямого подключения к PostgreSQL. При использовании Supabase они не нужны.

**Q: Где взять Database Password?**
A: Этот пароль вы создаете при создании проекта Supabase. Он нужен только для прямого подключения к БД, которое мы не используем.

**Q: Что делать если тесты не проходят?**
A: 
1. Проверьте правильность URL и ключей
2. Убедитесь что проект Supabase полностью создан
3. Выполните SQL скрипт для создания таблиц
4. Перезапустите приложение

**Q: Безопасно ли использовать ANON_KEY в браузере?**
A: Да, anon key предназначен для использования в браузере. Он имеет ограниченные права доступа через Row Level Security (RLS).

## 🚀 Следующие шаги:

После успешной настройки Supabase:
1. Настройте Telegram бота через @BotFather
2. Получите ваш User ID через @userinfobot
3. Перейдите на `/admin` для доступа к админ-панели
4. Настройте webhook через `/admin/setup`
