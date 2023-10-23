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

document.getElementById('submitButton').addEventListener('click', createUser);

function createUser() {
    const nomeUsuario = document.getElementById('nome').value;
    const emailUsuario = emailInput.value;
    const senhaUsuario = document.getElementById('senha').value;
    const nascido = document.getElementById('nascido').value;
    const cepUsuario = document.getElementById('cep').value;
    const ruaUsuario = document.getElementById('rua').value;
    const bairroUsuario = document.getElementById('bairro').value;
    const cidadeUsuario = document.getElementById('cidade').value;
    const ufUsuario = document.getElementById('uf').value;


    if (!nomeUsuario) {
        alert("Por favor, insira um nome!");
        return;
    }

    if (emailUsuario.indexOf('@') === -1) {
        alert("Por favor, insira um endereço de email válido!");
        return;
    }

    if (!senhaUsuario) {
        alert("Por favor, insira uma senha!");
        return;
    }

    if (!ruaUsuario || !bairroUsuario || !cidadeUsuario || !ufUsuario || !cepUsuario) {
        Swal.fire('Por favor, insira Dados do endereço')
        document.getElementById('id01').style.display='block';
        return;
    }

    const usuario = {
        nome: nomeUsuario,
        email: emailUsuario,
        senha: senhaUsuario,
        datanascimento: nascido,
        cep: cepUsuario,
        rua: ruaUsuario,
        bairro: bairroUsuario,
        cidade: cidadeUsuario,
        uf: ufUsuario
    };

    fetch('/backend/usuarios.php', { 
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
                'Usuário já existe!',
                'Cadastre um novo usuário!',
                'error'
              )
        } else {
            Swal.fire(
                'Perfeito!',
                'Usuário foi criado com sucesso!',
                'success'
              )
        } 
       
    })
    .catch(error => alert('Erro na requisição: ' + error));
}
