function updateUser() {
    const userId = document.getElementById("getUserId").value;
    const userName = document.getElementById("inpuNome").value;
    const userEmail = document.getElementById("inputEmail").value;
    const usuarioAtualizado = {
        nome: userName,
        email: userEmail
    };

    fetch('/backend/usuarios.php?id=' + userId, { 
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(usuarioAtualizado)
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
        if(!data.status){
            Swal.fire(
                'Erro ao Atualizar!',
                'O Usuário não foi atualizado',
                'error'
              )
        }else{
            Swal.fire(
                'Sucesso ao Atualizar!',
                'O Usuário foi atualizado',
                'success'
              )
        } 
        
    })
    .catch(error => alert('Erro na requisição: ' + error));
}
