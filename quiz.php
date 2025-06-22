<?php
$conn = new mysqli("localhost", "root", "", "quizzes_db");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (!isset($_GET['category']) || empty($_GET['category'])) {
    die("No category selected.");
}

$category_id = (int)$_GET['category'];

$catResult = $conn->query("SELECT name FROM categories WHERE id = $category_id");
if ($catResult->num_rows == 0) {
    die("Category not found.");
}
$category = $catResult->fetch_assoc()['name'];

$sql = "SELECT * FROM questions WHERE category_id = $category_id";
$result = $conn->query($sql);

if ($result->num_rows == 0) {
    die("No questions found for this category.");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Quiz: <?= htmlspecialchars($category) ?></title>
</head>
<body>
    <h1>Quiz: <?= htmlspecialchars($category) ?></h1>
    <form action="submit_quiz.php" method="post">
        <input type="hidden" name="category_id" value="<?= $category_id ?>">

        <label>
            Enter your name:
            <input type="text" name="username" required>
        </label>
        <br><br>

        <?php
        $qNum = 1;
        while ($row = $result->fetch_assoc()):
        ?>
            <fieldset>
                <legend>Question <?= $qNum ?>:</legend>
                <p><?= htmlspecialchars($row['question']) ?></p>
                <label><input type="radio" name="answers[<?= $row['id'] ?>]" value="A" required> <?= htmlspecialchars($row['option_a']) ?></label><br>
                <label><input type="radio" name="answers[<?= $row['id'] ?>]" value="B"> <?= htmlspecialchars($row['option_b']) ?></label><br>
                <label><input type="radio" name="answers[<?= $row['id'] ?>]" value="C"> <?= htmlspecialchars($row['option_c']) ?></label><br>
                <label><input type="radio" name="answers[<?= $row['id'] ?>]" value="D"> <?= htmlspecialchars($row['option_d']) ?></label><br>
            </fieldset>
            <br>
        <?php
        $qNum++;
        endwhile;
        ?>

        <button type="submit">Submit Quiz</button>
    </form>
</body>
</html>
