# 🌐 Подключение домена к Telegram Stars Bot

## 📋 Варианты доменов

### 1. 🆓 Бесплатные домены
- **Freenom** (.tk, .ml, .ga, .cf) - бесплатно на 1 год
- **Dot.tk** - бесплатные .tk домены
- **InfinityFree** - бесплатный хостинг с поддоменом

### 2. 💰 Платные домены
- **Namecheap** - от $8.88/год (.com)
- **GoDaddy** - от $12.99/год (.com)
- **Reg.ru** - от 199₽/год (.ru)
- **Cloudflare** - по себестоимости

## 🚀 Подключение к Vercel

### Способ 1: Через Vercel Dashboard

1. **Откройте проект** на vercel.com
2. **Перейдите в Settings** → Domains
3. **Добавьте домен:**
   \`\`\`
   yourdomain.com
   www.yourdomain.com
   \`\`\`
4. **Скопируйте DNS записи** которые покажет Vercel

### Способ 2: Через Vercel CLI

\`\`\`bash
# Установите Vercel CLI
npm i -g vercel

# Войдите в аккаунт
vercel login

# Добавьте домен
vercel domains add yourdomain.com

# Привяжите к проекту
vercel domains link yourdomain.com telegram-stars-bot
\`\`\`

## ⚙️ Настройка DNS

### У регистратора домена:

1. **Войдите в панель управления** доменом
2. **Найдите DNS настройки**
3. **Добавьте записи:**

```dns
Type: A
Name: @
Value: 76.76.19.61

Type: CNAME  
Name: www
Value: cname.vercel-dns.com
