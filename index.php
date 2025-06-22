<?php
$conn = new mysqli("localhost", "root", "", "quizzes_db");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM categories";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Select Quiz Category</title>
</head>
<body>
    <h1>Select a Quiz Category</h1>
    <form action="quiz.php" method="get">
        <select name="category" required>
            <option value="" disabled selected>-- Choose a category --</option>
            <?php while($row = $result->fetch_assoc()): ?>
                <option value="<?= $row['id'] ?>"><?= htmlspecialchars($row['name']) ?></option>
            <?php endwhile; ?>
        </select>
        <button type="submit">Start Quiz</button>
    </form>
</body>
</html>
