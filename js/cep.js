document.addEventListener("DOMContentLoaded", function() {
  let latjs;
  let lngjs;
  let mymap;

  // Função para atualizar o mapa
  function updateMap(lat, lng) {
    if (mymap) {
      mymap.remove();
    }
    mymap = L.map('mapid').setView([lat, lng], 13);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
      maxZoom: 18
    }).addTo(mymap);

    L.marker([lat, lng]).addTo(mymap);
  }

  // Função para limpar os campos do formulário
  function limpa_formulário_cep() {
    document.getElementById('rua').value = "";
    document.getElementById('bairro').value = "";
    document.getElementById('cidade').value = "";
    document.getElementById('uf').value = "";
    document.getElementById('ibge').value = "";
  }

  // Função de callback para processar os dados do CEP
  function meu_callback(conteudo) {
    if (!conteudo.erro) {
      document.getElementById('rua').value = conteudo.logradouro;
      document.getElementById('bairro').value = conteudo.bairro;
      document.getElementById('cidade').value = conteudo.localidade;
      document.getElementById('uf').value = conteudo.uf;
      document.getElementById('ibge').value = conteudo.ibge;

      // Obtém as coordenadas geográficas a partir do CEP
      let address = conteudo.logradouro + ',' + conteudo.localidade;
      axios.get(`https://nominatim.openstreetmap.org/search?q=${address}&format=json&limit=1`)
          .then(response => {
              latjs = response.data[0].lat;
              lngjs = response.data[0].lon;
              if (!isNaN(latjs) && !isNaN(lngjs)) { // Verifica se as coordenadas são números válidos
                  updateMap(latjs, lngjs);
              } else {
                  console.error('Coordenadas inválidas:', latjs, lngjs);
              }
          })
          .catch(error => {
              console.error('Erro ao obter coordenadas:', error);
          });
    } else {
      // CEP não Encontrado.
      limpa_formulário_cep();
      alert("CEP não encontrado.");
    }
  }

  // Função para pesquisar o CEP
  function pesquisacep(valor) {
    var cep = valor.replace(/\D/g, ''); // Remove caracteres não numéricos

    if (cep != "") {
      var validacep = /^[0-9]{8}$/; // Expressão regular para validar o CEP

      if (validacep.test(cep)) {
        // Preenche os campos com "..." enquanto consulta o webservice.
        document.getElementById('rua').value = "...";
        document.getElementById('bairro').value = "...";
        document.getElementById('cidade').value = "...";
        document.getElementById('uf').value = "...";
        document.getElementById('ibge').value = "...";

        var requestOptions = {
          method: 'GET',
          redirect: 'follow'
        };

        fetch(`https://viacep.com.br/ws/${cep}/json/`, requestOptions)
          .then(response => response.json())
          .then(data => meu_callback(data))
          .catch(error => {
            console.error('Erro na consulta do CEP:', error);
            limpa_formulário_cep();
            alert("Erro ao consultar o CEP.");
          });
      } else {
        // CEP é inválido.
        limpa_formulário_cep();
        alert("Formato de CEP inválido.");
      }
    } else {
      // CEP sem valor, limpa formulário.
      limpa_formulário_cep();
    }
  }

  // Event listener para o campo de CEP
  const input = document.getElementById('cep');
  input.addEventListener('blur', () => {
    pesquisacep(input.value);
  });
});
