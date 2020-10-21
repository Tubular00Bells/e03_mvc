# Shopping Pursuit
<p>App desenvolvido sobre o framework Flutter.</p>
<p><b>Vídeo: <a href="https://youtu.be/s9rg-ZEkNFM">https://youtu.be/s9rg-ZEkNFM</a></b></p>

<p>
<img src="images/gif.gif">
<img src="images/gif.gif" align="right">
</p>
<p align="center">
  <img src="images/title.png" width="50%">
</p>
<p>
<img src="images/gif.gif">
<img src="images/gif.gif" align="right">
</p>

## Overview
<p align="justify">Uma extensão do app prévio <a href="https://github.com/Tubular00Bells/e02_lista">Lista "Shopping Forgery"</a>, este app possui as mesmas funcionalidades de seu antecessor, com novas adicionadas: o app agora salva automaticamente (persiste) todo o conteúdo da lista de compras em um arquivo json, que é lido durante a inicialização do app. Ou seja, os itens da lista não são perdidos depois que o app é fechado.</p>
<p align="justify">Também foi adicionada a opção de escolha entre os temas Light e Dark para o app. Esta informação também é persistida, porém ela é salva através do plugin Shared Preferences.</p>
<p align="justify">A nível técnico, o app passou a ser organizado seguindo o padrão MVC. Ele foi separado nas seguintes quatro camadas:</p>
<ul>
<li><b>Model</b>, contendo a classe Item com seus três atributos: nome, preço e quantidade, e funções que transformam a instância da classe em um objeto json e vice-versa;</li>
<li><b>View</b>, onde estão todos os métodos de layout e design do app;</li>
<li><b>Controller</b>, que controla o fluxo dos dados, possuindo as funções de insert, update e delete;</li>
<li><b>Repository</b>, onde ficam os métodos que envolvem o acesso direto ao banco de dados (o arquivo data.json nesse caso).</li>
</ul> 