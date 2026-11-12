SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS recipes (
    id           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(150) NOT NULL,
    category     VARCHAR(50)  NOT NULL,
    ingredients  TEXT         NOT NULL,
    instructions TEXT         NOT NULL,
    cook_minutes SMALLINT UNSIGNED NOT NULL DEFAULT 30,
    created_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO recipes (title, category, ingredients, instructions, cook_minutes) VALUES
('Борщ', 'Первые блюда', 'Свёкла, капуста, картофель, морковь, лук, говядина, томатная паста',
 'Сварить бульон, добавить овощи, довести до готовности, подавать со сметаной.', 120),
('Омлет', 'Завтраки', 'Яйца, молоко, соль, сливочное масло',
 'Взбить яйца с молоком и солью, вылить на разогретую сковороду, готовить под крышкой 5 минут.', 10),
('Паста карбонара', 'Горячие блюда', 'Спагетти, бекон, яйца, пармезан, чёрный перец',
 'Отварить пасту, обжарить бекон, смешать с яично-сырным соусом вне огня.', 25),
('Греческий салат', 'Салаты', 'Огурцы, помидоры, перец, маслины, фета, оливковое масло',
 'Нарезать овощи крупно, добавить маслины и фету, заправить маслом.', 15),
('Шарлотка', 'Десерты', 'Яблоки, яйца, сахар, мука',
 'Взбить яйца с сахаром, добавить муку, залить яблоки тестом, выпекать 40 минут при 180 °C.', 60);
