import 'package:flutter/material.dart';
import 'package:e03_mvc/controllers/item.controller.dart';
import 'package:e03_mvc/models/item.model.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _itemController = TextEditingController();
  var _priceController = TextEditingController();
  var _amountController = TextEditingController();
  final _scrollController = ScrollController();
  List _lista = List<Item>();
  var _controller = ItemController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getAll().then((data) {
        setState(() {
          _lista = _controller.list;
        });
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('MO-NA-D-1 ~ Shopping Pursuit'),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            Image.asset('images/title.png'),
            for (int i = 0; i < _lista.length; i++)
              ListTile(
                  leading: ExcludeSemantics(
                    child: CircleAvatar(child: Text('${i + 1}')),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _listItemName(i),
                      _listItemPrice(i),
                      _listItemAmount(i),
                      _listDeleteIcon(i),
                    ],
                  )
                ),
            _listTotal(),
            SizedBox(
              child: Container(),
              height: 56.6+30.0
            )
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _displayDialog(context),
      ),
      
    );
  }

  _listTotal(){
    double total=0;
    for(int i=0; i <_lista.length;i++){
      total+=_lista[i].preco * _lista[i].quantidade;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total: "),
            Text(
              "R\$ "+total.toStringAsFixed(2),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),  
            )
          ],
        )
      )
    );
  }

  _listItemName(int i){
    return Expanded(
      child: Text(
       _lista[i].nome.toString(),
       style: TextStyle(
         fontWeight: FontWeight.bold
       )
      ),
    );
  }

  _listItemPrice(int i){
    String text = _lista[i].preco != null ? "R\$ "+_lista[i].preco.toStringAsFixed(2) : "";
    return Expanded(
      child: Text(
        text
      ),
    );
  }

  _listItemAmount(int i){
    String text = _lista[i].quantidade != null ? "x"+_lista[i].quantidade.toString() : "";
    return Expanded(
      child: Text(
        text
      ),
    );
  }

  _listDeleteIcon(int i){
    return IconButton(
      icon: Icon(
        Icons.close,
        size: 20.0,
        color: Colors.red[900],
      ),
      onPressed: () {
        String removedText = _lista[i].nome;
        _controller.delete(i).then((data) {
          _showSnackbar("Removido \""+removedText+"\"","DELETE",Colors.red);
          setState(() {
            _lista = _controller.list;
          });
        });
      },
    );
  }

  _displayDialog(context) async {
    if(_amountController.text == ""){
      _amountController.text = "1";
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                children: [
                  TextFormField(
                    controller: _itemController,
                    validator: (s) {
                      if (s.isEmpty)
                        return "Digite o nome do item.";
                      else
                        return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Nome do item"),
                  ),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Preço",
                      prefixText: "R\$ "
                    ),
                  ),
                  TextFormField(
                    controller: _amountController,
                    validator: (s) {
                      if (s.isEmpty){
                        return null;
                      }else{
                        int val = int.tryParse(s) ?? 1;
                        if(val < 1){
                          return "Digite um valor válido";
                        }
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Quantidade",
                      prefixText: "x"
                    ),
                  ),
                  Image.asset('images/gif.gif')
                ],
              )
            )
              
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text('SAVE'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    String addedText = "";
                    _controller.create(Item(
                      nome: _itemController.text,
                      preco: double.tryParse(_priceController.text) ?? 0,
                      quantidade: int.tryParse(_amountController.text) ?? 1
                    ));
                    setState(() {
                      _lista=_controller.list;
                      addedText = _itemController.text;
                      _itemController.text = "";
                      _priceController.text = "";
                      _amountController.text = "";
                      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                    });
                    Navigator.of(context).pop();
                    _showSnackbar("Adicionado \""+addedText+"\"","ADD",Colors.green);
                  }
                },
              )
            ],
          );
        });
  }

  _showSnackbar(String contentString, String labelString, Color color){
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        contentString
      ),
      action: SnackBarAction(
        label: labelString,
        textColor: color,
        onPressed: () {
          _scaffoldKey.currentState.hideCurrentSnackBar();
        },
      ),
    ));
  }
}