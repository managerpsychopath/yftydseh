# 🌟 Telegram Stars Bot

Telegram мини-приложение для продажи звёзд с админ-панелью и интеграцией Payment Kassa.

## 🚀 Быстрый старт

### 1. Клонирование проекта
\`\`\`bash
git clone https://github.com/your-username/telegram-stars-bot.git
cd telegram-stars-bot
npm install
\`\`\`

### 2. Настройка переменных окружения
\`\`\`bash
# Скопируйте пример конфигурации
cp .env.example .env

# Отредактируйте .env файл с вашими данными
nano .env
\`\`\`

### 3. Настройка Supabase
1. Создайте проект на [supabase.com](https://supabase.com)
2. Перейдите в Settings → API
3. Скопируйте URL и ключи в .env
4. Выполните SQL скрипты из папки `scripts/`

### 4. Создание Telegram бота
1. Найдите [@BotFather](https://t.me/BotFather) в Telegram
2. Отправьте `/newbot`
3. Следуйте инструкциям
4. Скопируйте токен в .env

### 5. Получение Telegram ID
1. Найдите [@userinfobot](https://t.me/userinfobot)
2. Отправьте любое сообщение
3. Скопируйте User ID в .env

### 6. Настройка Payment Kassa
1. Зарегистрируйтесь на [paymentkassa.com](https://paymentkassa.com)
2. Создайте магазин
3. Получите API данные
4. Заполните в .env

### 7. Запуск проекта
\`\`\`bash
# Локальная разработка
npm run dev

# Открыть http://localhost:3000
\`\`\`

## 📁 Структура проекта

\`\`\`
telegram-stars-bot/
├── app/                    # Next.js App Router
│   ├── admin/             # Админ-панель
│   ├── api/               # API маршруты
│   └── page.tsx           # Главная страница
├── components/            # React компоненты
├── lib/                   # Утилиты и конфигурация
├── scripts/               # SQL скрипты для БД
└── public/                # Статические файлы
\`\`\`

## 🔧 API Endpoints

### Платежи
- `POST /api/payment/payment-kassa` - Создание платежа
- `POST /api/payment/gift-certificate` - Покупка сертификата
- `POST /api/webhook/payment-kassa` - Webhook от Payment Kassa

### Админ-панель
- `GET /api/admin/stats` - Статистика
- `GET /api/admin/users` - Список пользователей
- `GET /api/admin/payments` - История платежей
- `POST /api/admin/approve-payment` - Подтверждение платежа

### Telegram
- `POST /api/webhook/telegram-bot` - Webhook для кнопок
- `POST /api/certificates/activate` - Активация сертификата

## 🌐 Деплой на Vercel

### 1. Подключение GitHub
1. Перейдите на [vercel.com](https://vercel.com)
2. Войдите через GitHub
3. Импортируйте репозиторий

### 2. Настройка переменных
Добавьте все переменные из .env в настройки Vercel:
- Settings → Environment Variables
- Добавьте каждую переменную

### 3. Обновление URL
После деплоя обновите:
\`\`\`env
NEXT_PUBLIC_APP_URL=https://your-project.vercel.app
\`\`\`

### 4. Настройка webhook
1. Перейдите на `/admin/setup`
2. Нажмите "Настроить webhook"

## 🔐 Безопасность

### Переменные окружения
- `.env` файл НЕ загружается в Git
- Используйте `.env.example` как шаблон
- Никогда не публикуйте секретные ключи

### Админ доступ
- Доступ только по `ADMIN_USER_ID`
- Все действия логируются в `ADMIN_CHAT_ID`
- Двухфакторная авторизация через Telegram

## 📊 Функции

### Для пользователей
- 💳 Покупка звёзд через Payment Kassa
- 🎁 Покупка подарочных сертификатов
- 📱 Telegram мини-приложение
- 💰 Система скидок

### Для админов
- 📈 Статистика продаж
- 👥 Управление пользователями
- 💸 История платежей
- ⚙️ Настройка скидок
- 🎫 Управление сертификатами

## 🛠️ Разработка

### Локальный запуск
\`\`\`bash
npm run dev          # Запуск в режиме разработки
npm run build        # Сборка для продакшена
npm run start        # Запуск продакшен версии
npm run lint         # Проверка кода
\`\`\`

### Тестирование
\`\`\`bash
# Проверка подключения к Supabase
curl http://localhost:3000/api/health

# Тест админ-панели
curl http://localhost:3000/admin
\`\`\`

## 📞 Поддержка

Если у вас возникли вопросы:
1. Проверьте файл `SETUP_GUIDE.md`
2. Убедитесь что все переменные заполнены
3. Проверьте логи в консоли браузера

## 📄 Лицензия

MIT License - используйте свободно для коммерческих и некоммерческих проектов.
