# Recipes App вЂ” РєРЅРёРіР° СЂРµС†РµРїС‚РѕРІ (PHP + MySQL + Nginx РІ Docker)

РЈС‡РµР±РЅС‹Р№ РїСЂРѕРµРєС‚: РІРµР±-РїСЂРёР»РѕР¶РµРЅРёРµ, РєРѕС‚РѕСЂРѕРµ РІС‹РІРѕРґРёС‚ С‚Р°Р±Р»РёС†Сѓ СЂРµС†РµРїС‚РѕРІ РёР· MySQL.

## РЎРѕСЃС‚Р°РІ
| РЎРµСЂРІРёСЃ | РћР±СЂР°Р· | РџРѕСЂС‚ РЅР° С…РѕСЃС‚Рµ |
|--------|-------|---------------|
| nginx  | nginx:alpine | 8080 |
| php    | recipes-app-php (php:8.2-fpm + pdo_mysql) | вЂ” |
| mysql  | mysql:8 | 3308 |

## Р—Р°РїСѓСЃРє
```bash
git clone <URL СЂРµРїРѕР·РёС‚РѕСЂРёСЏ> recipes-app
cd recipes-app
cp .env.example .env      # РїСЂРё РЅРµРѕР±С…РѕРґРёРјРѕСЃС‚Рё РёР·РјРµРЅРёС‚Рµ РїР°СЂРѕР»Рё
docker compose up -d --build
docker compose ps
```
РЎР°Р№С‚: http://localhost:8080

## РџРѕРґРєР»СЋС‡РµРЅРёРµ Рє Р‘Р” РёР· DBeaver
- Driver: MySQL, Host: `localhost`, Port: `3308`
- Database: `recipes`
- Username / Password вЂ” РёР· С„Р°Р№Р»Р° `.env` (`MYSQL_USER` / `MYSQL_PASSWORD`)
- Р•СЃР»Рё DBeaver РїРёС€РµС‚ `Public Key Retrieval is not allowed` вЂ” РІ Driver properties РїРѕСЃС‚Р°РІРёС‚СЊ `allowPublicKeyRetrieval=true`.

## Р›РѕРіРё Рё РѕСЃС‚Р°РЅРѕРІРєР°
```bash
docker compose logs mysql
docker compose logs php
docker compose logs nginx
docker compose down        # РѕСЃС‚Р°РЅРѕРІРёС‚СЊ (РґР°РЅРЅС‹Рµ СЃРѕС…СЂР°РЅСЏСЋС‚СЃСЏ РІ volume)
docker compose down -v     # РѕСЃС‚Р°РЅРѕРІРёС‚СЊ Рё СѓРґР°Р»РёС‚СЊ РґР°РЅРЅС‹Рµ
```

## РЎС‚СЂСѓРєС‚СѓСЂР°
```
recipes-app/
в”њв”Ђв”Ђ db/init.sql            # СЃС…РµРјР° Рё С‚РµСЃС‚РѕРІС‹Рµ РґР°РЅРЅС‹Рµ (РІС‹РїРѕР»РЅСЏРµС‚СЃСЏ РѕРґРёРЅ СЂР°Р·)
в”њв”Ђв”Ђ nginx/default.conf
в”њв”Ђв”Ђ php/Dockerfile
в”њв”Ђв”Ђ src/ (db.php, index.php)
в”њв”Ђв”Ђ docker-compose.yml
в”њв”Ђв”Ђ .env.example           # С€Р°Р±Р»РѕРЅ РїРµСЂРµРјРµРЅРЅС‹С… (.env РЅРµ РєРѕРјРјРёС‚РёРј)
в””в”Ђв”Ђ README.md
```
> `init.sql` РІС‹РїРѕР»РЅСЏРµС‚СЃСЏ С‚РѕР»СЊРєРѕ РїСЂРё РїРµСЂРІРѕРј СЃРѕР·РґР°РЅРёРё volume. Р§С‚РѕР±С‹ РїСЂРёРјРµРЅРёС‚СЊ РµРіРѕ Р·Р°РЅРѕРІРѕ: `docker compose down -v`.
