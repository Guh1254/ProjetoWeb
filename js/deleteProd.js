function deleteProd() {
    const prodId = document.getElementById("getProdId").value;
    fetch('/backend/produtos.php?id=' + prodId,  {
        method: 'DELETE'
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
                'Erro ao Deletar!',
                'O Produto não foi deletado',
                'error'
              )
        }else{
            Swal.fire(
                'Deletado com sucesso!',
                'O Produto foi deletado',
                'success'
              )
            document.getElementById("inputNome").value = ''; 
            document.getElementById("inputPreco").value = ''; 
            document.getElementById("inputQuantidade").value = ''; 
        } 
        
    })
    .catch(error => alert('Erro na requisição: ' + error));
}