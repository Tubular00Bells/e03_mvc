# Shopping Pursuit
<p>App desenvolvido sobre o framework Flutter.</p>
<p><b>Vídeo: <a href="#">N/A</a></b></p>

<p align="center">
  <img src="images/title.png" width="50%">
</p>

## Overview
<p align="justify">Uma extensão do app prévio <a href="https://github.com/Tubular00Bells/e02_lista">Lista "Shopping Forgery"</a>, este app possui as mesmas funcionalidades de seu antecessor, com uma nova adicionada: o app agora salva automaticamente (persiste) todo o conteúdo da lista de compras em um arquivo json.</p>
<p align="justify">A nível técnico, o app também passou a ser organizado seguindo o padrão MVC. Ele foi separado nas seguinte quatro camadas:</p>
<ul>
<li><b>Model</b>, contendo a classe Item com seus três atributos: nome, preço e quantidade, e funções que transformam a instância da classe em um objeto json e vice-versa;</li>
<li><b>View</b>, onde estão os métodos de layout e todo o design do app;</li>
<li><b>Controller</b>, que controla o fluxo de dados, possuindo as funções de insert, update e delete;</li>
<li><b>Repository</b>, onde ficam os métodos que envolvem o acesso direto ao banco de dados (o arquivo data.json nesse caso).</li>
</ul> 