class Item {
  String nome;
  double preco;
  int quantidade;

  Item({this.nome, this.preco, this.quantidade});

  Item.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    preco = json['preco'];
    quantidade = json["quantidade"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['preco'] = this.preco;
    data['quantidade'] = this.quantidade;
    return data;
  }
}