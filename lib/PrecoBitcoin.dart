import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PrecoBitcoin extends StatefulWidget {
  @override
  _PrecoBitcoinState createState() => _PrecoBitcoinState();
}

class _PrecoBitcoinState extends State<PrecoBitcoin> {
  
  String precoBitcoin = '0,00';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Image.asset(
              'images/bitcoin.png',
              width: 200,
              ),
            ),
          Padding(
            
            padding: EdgeInsets.only(top:20, left: 150, right: 20),
            child:Text(
              'R\$ '+precoBitcoin,
              style: TextStyle(
                fontSize: 25
              ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              color: Colors.orange[500],
              child: Text(
                'Atualizar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: ()=> _atualizarPreco(),
              ),
            ),
        ],
      ),
    );
  }

  void _atualizarPreco() async {
    String url = 'https://blockchain.info/ticker';
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    var preco =  retorno['BRL']['buy'];
   setState(() {
     precoBitcoin = preco.toString();
   });
  }
}