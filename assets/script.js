document.addEventListener('DOMContentLoaded', () => {
    loadJogadores();
    
    const form = document.getElementById('jogadorForm');
    const btnCancel = document.getElementById('btnCancel');
    const errorSpan = document.getElementById('validationError');
    const nomeInput = document.getElementById('nome');

    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        errorSpan.textContent = '';
        
        const nome = nomeInput.value.trim();
        const action = document.getElementById('formAction').value;

        // ✅ Validação Frontend
        if (!nome) {
            errorSpan.textContent = 'O nome é obrigatório.';
            return;
        }
        if (nome.length > 45) {
            errorSpan.textContent = 'Máximo de 45 caracteres permitido.';
            return;
        }

        const formData = new FormData(form);
        try {
            const res = await fetch('crud.php', { method: 'POST', body: formData });
            const data = await res.json();
            
            if (data.success) {
                alert(data.message);
                form.reset();
                resetFormState();
                loadJogadores();
            } else {
                errorSpan.textContent = data.message; // Validação Backend
            }
        } catch (err) {
            errorSpan.textContent = 'Erro de comunicação com o servidor.';
        }
    });

    btnCancel.addEventListener('click', () => {
        form.reset();
        resetFormState();
    });

    // Funções globais para acesso via onclick
    window.editJogador = (id, nome) => {
        document.getElementById('formAction').value = 'update';
        document.getElementById('formId').value = id;
        nomeInput.value = nome;
        document.getElementById('btnSubmit').textContent = '💾 Atualizar';
        btnCancel.style.display = 'inline-block';
        nomeInput.focus();
    };

    window.deleteJogador = async (id) => {
        if (!confirm('⚠️ Tem certeza que deseja excluir este jogador?')) return;
        
        const formData = new FormData();
        formData.append('action', 'delete');
        formData.append('id', id);
        
        try {
            const res = await fetch('crud.php', { method: 'POST', body: formData });
            const data = await res.json();
            if (data.success) loadJogadores();
            else alert(data.message);
        } catch {
            alert('Erro ao excluir.');
        }
    };

    function resetFormState() {
        document.getElementById('formAction').value = 'create';
        document.getElementById('formId').value = '';
        document.getElementById('btnSubmit').textContent = '➕ Adicionar';
        btnCancel.style.display = 'none';
        errorSpan.textContent = '';
    }

    async function loadJogadores() {
        try {
            const res = await fetch('crud.php?action=list');
            const { success, data } = await res.json();
            const tbody = document.querySelector('#tabelaJogadores tbody');
            
            if (success && Array.isArray(data) && data.length > 0) {
                tbody.innerHTML = data.map(j => `
                    <tr>
                        <td>${escapeHtml(j.id)}</td>
                        <td>${escapeHtml(j.nome)}</td>
                        <td>
                            <button class="btn-edit" onclick="editJogador(${j.id}, '${j.nome.replace(/'/g, "\\'")}')">✏️ Editar</button>
                            <button class="btn-delete" onclick="deleteJogador(${j.id})">🗑️ Excluir</button>
                        </td>
                    </tr>
                `).join('');
            } else {
                tbody.innerHTML = '<tr><td colspan="3" style="text-align:center;">Nenhum jogador cadastrado.</td></tr>';
            }
        } catch {
            document.querySelector('#tabelaJogadores tbody').innerHTML = '<tr><td colspan="3" style="color:red;text-align:center;">Erro ao carregar dados.</td></tr>';
        }
    }

    // 🔒 Proteção contra XSS na renderização
    function escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }
});