import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:conversor/conversor.dart'; //plugin utilizado para a conversão de números binários, decimais e hexadecimais.

class Segundo extends StatefulWidget {
  @override
  _SegundoState createState() => _SegundoState();
}

class _SegundoState extends State<Segundo> {
  TextEditingController _controllerPrimeiro = TextEditingController();
  TextEditingController _controllerOperador = TextEditingController();
  TextEditingController _controllerSegundo = TextEditingController();
  String _textoResultado = ""; // campo para exibir o resultado
  dynamic _resultado = 0; //dynamic pois a variável precisava se modificar em cada resultado, para não ocasionar erros de conversão

  void _limparCampos() { // função para limpar os campos ao clicar no botão de calcular
    _controllerPrimeiro.text = "";
    _controllerOperador.text = "";
    _controllerSegundo.text = "";
  }

  void _calcular() {
    num _primeiroNum = num.tryParse(_controllerPrimeiro.text);
    num _segundoNum = num.tryParse(_controllerSegundo.text);
    String operador = _controllerOperador.text;
 
    if (_primeiroNum == null || _segundoNum == null) { //if para verificar se estão preenchidos corretamente os campos e, depois, realizar a verificação de qual a operação
      setState(() {                                     // matemática está sendo realizada durante calculo.
        _textoResultado = "Verifique os números digitados";
      });
    } else {
      if (operador == "+") {
        setState(() {
          _resultado = _primeiroNum + _segundoNum;

          _textoResultado = "O primeiro número em binário é: " +
              ConversorBases.toBinary(_primeiroNum) +
              ", o segundo é: " +
              ConversorBases.toBinary(_segundoNum) +
              " e sua soma é: " +
              ConversorBases.toBinary(_resultado);
        });
      } else {
        if (operador == "-") {
          setState(() {
            _resultado = _primeiroNum - _segundoNum;

            _textoResultado = "O primeiro número em binário é: " +
                ConversorBases.toBinary(_primeiroNum) +
                ", o segundo é: " +
                ConversorBases.toBinary(_segundoNum) +
                " e sua subtração é: " +
                ConversorBases.toBinary(_resultado);
          });
        } else {
          if (operador == "*") {
            setState(() {
              _resultado = _primeiroNum * _segundoNum;
              _textoResultado = "O primeiro número em binário é: " +
                  ConversorBases.toBinary(_primeiroNum) +
                  ", o segundo é: " +
                  ConversorBases.toBinary(_segundoNum) +
                  " e sua multiplicação é: " +
                  ConversorBases.toBinary(_resultado);
            });
          } else {
            if (operador == "/") {
              setState(() {
                _resultado = _primeiroNum / _segundoNum;
                _textoResultado = "O primeiro número em binário é: " +
                    ConversorBases.toBinary(_primeiroNum) +
                    ", o segundo é: " +
                    ConversorBases.toBinary(_segundoNum) +
                    " e sua subtração é: " +
                    ConversorBases.toBinary(_resultado);
              });
            }
          }
        }
      }
      _limparCampos(); //limpa os campos após a execução
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text("Exercício 2"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Digite os números que deseja calcular e converter:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Primeiro número"),
                style: TextStyle(fontSize: 22),
                controller: _controllerPrimeiro,
              ),
              TextField(
                keyboardType: TextInputType.name,
                maxLength: 1,
                decoration: InputDecoration(labelText: "Operação (+ - * ou /)"),
                style: TextStyle(fontSize: 22),
                controller: _controllerOperador,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Segundo número"),
                style: TextStyle(fontSize: 22),
                controller: _controllerSegundo,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular e converter", // calcula e já converte o número, exibindo a resposta logo abaixo
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(_textoResultado,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
