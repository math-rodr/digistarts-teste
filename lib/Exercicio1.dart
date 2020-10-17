import 'dart:io';
import 'package:flutter/material.dart';

class Primeiro extends StatefulWidget {
  @override
  _PrimeiroState createState() => _PrimeiroState();
}

class _PrimeiroState extends State<Primeiro> {
  TextEditingController _controllerNumero = TextEditingController();
  List<String> _numeros = [];

  _exibirLista() {
    for (var _numeros; _numeros > 0; _numeros++) {
      setState(() {
        _addNumero();
      });
    }
  }

  _addNumero() {
    _numeros.add('$_controllerNumero');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text("Exercício 1"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite um número"),
              style: TextStyle(fontSize: 22),
              controller: _controllerNumero,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.deepPurple,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                child: Text(
                  "Adicionar",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: _addNumero,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(_exibirLista.toString()),
            ),
          ],
        ));
  }
}
