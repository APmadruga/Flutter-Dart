import 'dart:ui';
import 'package:flutter/material.dart';

//adicionando Scroll.

class AlcoolOuGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  TextEditingController _textEditingControllerAlcool = TextEditingController();

  calcular(String inputTextA, String inputTextG) {
    //method parse(inputTextA) does the same thing, but less safe.
    //[source].parse("invalid arg")
    String temp = "";

    double precoAlcool = double.tryParse(inputTextA);
    double precoGasolina = double.tryParse(inputTextG);
    if (precoAlcool == null || precoGasolina == null) {
      temp = "Preço nulo";
    } else {

      precoAlcool / precoGasolina >= 0.7
          ? temp = 'Compra Gasolina!'
          : temp = 'Compra Alcool!';
    }
    setState(() {
      _textoResultado = temp;
    });
    print(precoAlcool.runtimeType);
    print(inputTextG);
/*    If the [source] string is not a valid double literal, the [onError]
    * is called with the [source] as argument, and its return value is
    * used instead. If no `onError` is provided, a [FormatException]
    * is thrown instead.
    *
    * The [onError] function is only invoked if [source] is a [String] with an
    * invalid format. It is not invoked if [source] is `null`.*/
    //with tryParse("invalid arg") it returns null allways.
    print(_textoResultado);

    _limparCampos();
  }

  void _limparCampos(){
    //quando é utilizado diretamente o TextEditingControler o metodo serState((){}) é chamado automaticamente não sendo necessario asua utilização para que o feito surja na view
    _textEditingControllerAlcool.text = "";
    _textEditingControllerGasolina.text = "";
  }

  TextEditingController _textEditingControllerGasolina =
      TextEditingController();

  String _textoResultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlcoolOuGasolina"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          //INSERIR O SCROLLVIEW na minha aplicação
          child: SingleChildScrollView(
            child: Column(
              //assim o botão ocupa toda a area da coluna
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //logo
                Image.asset("images/logo.png"),
                //texto
                Text(
                  "Saiba qual a melhor opção na hora de abastecer o seu carro",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //campo de entrada para o alcool
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.52 ",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  controller: _textEditingControllerAlcool,
                ),
                //campo de entrada para a gasolina
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.15 ",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  controller: _textEditingControllerGasolina,
                ),
                ElevatedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  //EdgeInsets.all(20)
                  onPressed: () {
                    calcular(_textEditingControllerAlcool.text,
                        _textEditingControllerGasolina.text);
                  },
                ),
                Text(
                  _textoResultado,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
