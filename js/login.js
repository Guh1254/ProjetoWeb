const senhaInput = document.getElementById('senha');
const mostrarSenhaBtn = document.getElementById('mostrarSenha');
const emailInput = document.getElementById('email');

let senhaVisivel = false;

mostrarSenhaBtn.addEventListener('click', () => {
    if (senhaVisivel) {
        senhaInput.type = 'password';
        mostrarSenhaBtn.textContent = 'Mostrar Senha';
    } else {
        senhaInput.type = 'text';
        mostrarSenhaBtn.textContent = 'Ocultar Senha';
    }
    senhaVisivel = !senhaVisivel;
});

document.getElementById('loginForm').addEventListener('click', createUser);

    var emailUsuario = emailInput.value;
    var senhaUsuario = document.getElementById('senha').value;



    if (emailUsuario.indexOf('@') === -1) {
        alert("Por favor, insira um endereço de email válido!");
        return;
    }

    if (!senhaUsuario) {
        alert("Por favor, insira uma senha!");
        return;
    }


    const usuario = {
        email: emailUsuario,
        senha: senhaUsuario,
    };

    fetch('/backend/login.php', { 
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(usuario)
    })
    .then(response => {
        if (!response.ok) {
            if (response.status === 401) {
                throw new Error('Não autorizado');
            } else {
                throw new Error('Sem rede ou não conseguiu localizar o recurso');
            }
        }
        return response.json();
    })
    .then(data => {
        if (!data.status){
            Swal.fire(
                'Erro!',
                'Não foi possivel logar!',
                'error'
              )
        } else {
            Swal.fire(
                'Perfeito!',
                'Logado com sucesso!',
                'success'
              )
        } 
       
    })
    .catch(error => alert('Erro na requisição: ' + error));

