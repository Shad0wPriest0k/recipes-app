# Recipes App — книга рецептов (PHP + MySQL + Nginx в Docker)

Учебный проект: веб-приложение, которое выводит таблицу рецептов из MySQL.

## Состав
| Сервис | Образ | Порт на хосте |
|--------|-------|---------------|
| nginx  | nginx:alpine | 8080 |
| php    | recipes-app-php (php:8.2-fpm + pdo_mysql) | — |
| mysql  | mysql:8 | 3307 |

## Запуск
```bash
git clone <URL репозитория> recipes-app
cd recipes-app
cp .env.example .env      # при необходимости измените пароли
docker compose up -d --build
docker compose ps
```
Сайт: http://localhost:8080

## Подключение к БД из DBeaver
- Driver: MySQL, Host: `localhost`, Port: `3307`
- Database: `recipes`
- Username / Password — из файла `.env` (`MYSQL_USER` / `MYSQL_PASSWORD`)
- Если DBeaver пишет `Public Key Retrieval is not allowed` — в Driver properties поставить `allowPublicKeyRetrieval=true`.

## Логи и остановка
```bash
docker compose logs mysql
docker compose logs php
docker compose logs nginx
docker compose down        # остановить (данные сохраняются в volume)
docker compose down -v     # остановить и удалить данные
```

## Структура
```
recipes-app/
├── db/init.sql            # схема и тестовые данные (выполняется один раз)
├── nginx/default.conf
├── php/Dockerfile
├── src/ (db.php, index.php)
├── docker-compose.yml
├── .env.example           # шаблон переменных (.env не коммитим)
└── README.md
```
> `init.sql` выполняется только при первом создании volume. Чтобы применить его заново: `docker compose down -v`.
