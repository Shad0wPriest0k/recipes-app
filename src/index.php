<?php
require __DIR__ . '/db.php';

$recipes = $pdo->query('SELECT * FROM recipes ORDER BY id')->fetchAll();
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Книга рецептов</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 900px; margin: 30px auto; padding: 0 15px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; vertical-align: top; }
        th { background: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Книга рецептов</h1>
    <p>Всего рецептов: <?= count($recipes) ?></p>
    <table>
        <tr>
            <th>ID</th><th>Название</th><th>Категория</th>
            <th>Ингредиенты</th><th>Приготовление</th><th>Время, мин</th>
        </tr>
        <?php foreach ($recipes as $r): ?>
        <tr>
            <td><?= (int)$r['id'] ?></td>
            <td><?= htmlspecialchars($r['title']) ?></td>
            <td><?= htmlspecialchars($r['category']) ?></td>
            <td><?= htmlspecialchars($r['ingredients']) ?></td>
            <td><?= htmlspecialchars($r['instructions']) ?></td>
            <td><?= (int)$r['cook_minutes'] ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
