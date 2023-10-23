function updateProd() {
    const prodId = document.getElementById("getProdId").value;
    const prodName = document.getElementById("inputNome").value;
    const prodPreco = document.getElementById("inputPreco").value;
    const prodQuantidade = document.getElementById("inputQuantidade").value;
    const produtoAtualizado = {
        nome: prodName,
        preco: prodPreco,
        quantidade: prodQuantidade
    };

    fetch('/backend/produtos.php?id=' + prodId,  { 
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(produtoAtualizado)
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
                'O Produto não foi atualizado',
                'error'
              )
        }else{
            Swal.fire(
                'Sucesso ao Atualizar!',
                'O Produto foi atualizado',
                'success'
              )
        } 
        
    })
    .catch(error => alert('Erro na requisição: ' + error));
}
