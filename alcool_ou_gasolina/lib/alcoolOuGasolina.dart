import 'dart:ui';
import 'package:flutter/material.dart';

//adicionando Scroll.

class AlcoolOuGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina =
      TextEditingController();
  String _textoResultado = '';

  calcular(String inputTextA, String inputTextG) {
    //method parse(inputTextA) does the same thing, but less safe.
    //[source].parse("invalid arg")

    double precoAlcool = double.tryParse(inputTextA);
    double precoGasolina = double.tryParse(inputTextG);
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
String temp = "";
    precoAlcool > precoGasolina ? temp = 'Compra Gasolina!' : 'Compra Gasoleo!';

    setState(() {
      _textoResultado = temp;
    });
  }

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
                RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.all(15),
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
