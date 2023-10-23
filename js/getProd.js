function getProd() {
    const prodId = document.getElementById("getProdId").value;

    fetch('/backend/produtos.php?id=' + prodId, {
        method: 'GET'
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
                'Erro!',
                'O Produto não foi encontrado',
                'error'
              )
            document.getElementById("inputNome").value = ''; 
        }else{
            document.getElementById("inputNome").value = data.produto.nome; 
            document.getElementById("inputPreco").value = data.produto.preco; 
            document.getElementById("inputQuantidade").value = data.produto.quantidade; 
        } 
       
    })
    .catch(error => alert('Erro na requisição: ' + error));
}