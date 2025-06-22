<?php
session_start();

$conn = new mysqli("localhost", "root", "", "quizzes_db");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die("Invalid request.");
}

if (!isset($_POST['category_id'], $_POST['answers'], $_POST['username'])) {
    die("Incomplete submission.");
}

$category_id = (int)$_POST['category_id'];
$answers = $_POST['answers'];
$username = trim($_POST['username']);

if (!$username) {
    die("Please provide your name.");
}

$sql = "SELECT id, correct_option FROM questions WHERE category_id = $category_id";
$result = $conn->query($sql);

if ($result->num_rows == 0) {
    die("No questions found for this category.");
}

$total_questions = 0;
$correct = 0;

while ($row = $result->fetch_assoc()) {
    $total_questions++;
    $qid = $row['id'];
    $correct_option = strtoupper($row['correct_option']);

    if (isset($answers[$qid]) && strtoupper($answers[$qid]) === $correct_option) {
        $correct++;
    }
}

$score = $correct;

$stmt = $conn->prepare("INSERT INTO scores (username, category_id, score) VALUES (?, ?, ?)");
$stmt->bind_param("sii", $username, $category_id, $score);
$stmt->execute();

$score_id = $stmt->insert_id;

$_SESSION['score_id'] = $score_id;
$_SESSION['category_id'] = $category_id;
$_SESSION['username'] = $username;
$_SESSION['score'] = $score;
$_SESSION['total_questions'] = $total_questions;

header("Location: results.php");
exit();
?>