<?php
// config.php
$host = 'localhost';
$db   = 'db_interclasse';
$user = 'root'; // Altere conforme seu ambiente
$pass = 'root';     // Altere conforme seu ambiente
$charset = 'utf8';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => true,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    http_response_code(500);
    die(json_encode(['success' => false, 'message' => 'Erro na conexão com o banco de dados.']));
}
?>