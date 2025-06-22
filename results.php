<?php
session_start();

if (!isset($_SESSION['score_id'])) {
    die("No quiz results found.");
}

$conn = new mysqli("localhost", "root", "", "quizzes_db");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$category_id = (int)$_SESSION['category_id'];
$username = $_SESSION['username'];
$score = (int)$_SESSION['score'];
$total_questions = (int)$_SESSION['total_questions'];

$sqlRank = "SELECT COUNT(*) + 1 AS rank FROM scores WHERE category_id = $category_id AND score > $score";
$rankResult = $conn->query($sqlRank);
$rankRow = $rankResult->fetch_assoc();
$rank = $rankRow['rank'];

$sqlTotal = "SELECT COUNT(*) AS total FROM scores WHERE category_id = $category_id";
$totalResult = $conn->query($sqlTotal);
$totalRow = $totalResult->fetch_assoc();
$total_players = $totalRow['total'];

session_unset();
session_destroy();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Quiz Results</title>
</head>
<body>
    <h1>Quiz Results</h1>
    <p>Name: <?= htmlspecialchars($username) ?></p>
    <p>Score: <?= $score ?> out of <?= $total_questions ?></p>
    <p>Your rank: <?= $rank ?> out of <?= $total_players ?> people who have taken this quiz.</p>
    <a href="index.php">Take another quiz</a>
</body>
</html>
