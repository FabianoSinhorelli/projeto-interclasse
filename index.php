<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD Jogadores - Interclasse</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div class="container">
        <h1>🏆 Gerenciamento de Jogadores</h1>
        
        <form id="jogadorForm" autocomplete="off">
            <input type="hidden" name="action" id="formAction" value="create">
            <input type="hidden" name="id" id="formId" value="">
            <div class="form-group">
                <label for="nome">Nome do Jogador</label>
                <input type="text" id="nome" name="nome" maxlength="45" placeholder="Ex: Ronaldo" required>
                <span id="validationError" class="error-msg"></span>
            </div>
            <div class="buttons">
                <button type="submit" id="btnSubmit">➕ Adicionar</button>
                <button type="button" id="btnCancel" style="display:none;">❌ Cancelar</button>
            </div>
        </form>

        <table id="tabelaJogadores">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <tr><td colspan="3" class="loading">Carregando...</td></tr>
            </tbody>
        </table>
    </div>
    <script src="assets/script.js"></script>
</body>
</html>