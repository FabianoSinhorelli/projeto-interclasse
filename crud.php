<?php
// crud.php
require_once 'config.php';
header('Content-Type: application/json; charset=utf-8');

$action = $_REQUEST['action'] ?? '';
$response = ['success' => false, 'message' => '', 'data' => null];

try {
    switch ($action) {
        case 'list':
            $stmt = $pdo->query("SELECT id, nome FROM tbl_jogadores ORDER BY nome ASC");
            $response = ['success' => true, 'data' => $stmt->fetchAll()];
            break;

        case 'create':
            $nome = trim($_POST['nome'] ?? '');
            if (empty($nome) || strlen($nome) > 45) {
                throw new Exception("Nome inválido. Deve conter entre 1 e 45 caracteres.");
            }
            $stmt = $pdo->prepare("INSERT INTO tbl_jogadores (nome) VALUES (:nome)");
            $stmt->execute(['nome' => $nome]);
            $response = ['success' => true, 'message' => 'Jogador cadastrado com sucesso!'];
            break;

        case 'update':
            $id = filter_var($_POST['id'] ?? '', FILTER_VALIDATE_INT);
            $nome = trim($_POST['nome'] ?? '');
            if (!$id || empty($nome) || strlen($nome) > 45) {
                throw new Exception("Dados inválidos para atualização.");
            }
            $stmt = $pdo->prepare("UPDATE tbl_jogadores SET nome = :nome WHERE id = :id");
            $stmt->execute(['nome' => $nome, 'id' => $id]);
            $response = ['success' => true, 'message' => 'Jogador atualizado com sucesso!'];
            break;

        case 'delete':
            $id = filter_var($_POST['id'] ?? '', FILTER_VALIDATE_INT);
            if (!$id) throw new Exception("ID inválido.");
            
            // Nota: Se houver restrições de FK em tbl_boletim ou tbl_times_has_tbl_jogadores,
            // o MySQL bloqueará a exclusão. Em produção, use ON DELETE CASCADE ou verifique dependências.
            $stmt = $pdo->prepare("DELETE FROM tbl_jogadores WHERE id = :id");
            $stmt->execute(['id' => $id]);
            $response = ['success' => true, 'message' => 'Jogador excluído com sucesso!'];
            break;

        default:
            throw new Exception("Ação não reconhecida.");
    }
} catch (Exception $e) {
    $response = ['success' => false, 'message' => $e->getMessage()];
}

echo json_encode($response);
?>