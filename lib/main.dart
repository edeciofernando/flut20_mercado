import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador SuperAvenida',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text('Supermercado Avenida'),
      ),
      body: ListView(children: <Widget>[
        HomeCab(),
        Pessoas(),
      ]),
    );
  }
}

class HomeCab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Image.network(
          "https://s2.glbimg.com/Y8aR1x__aAdk_yVpZCOXrPDqPNw=/620x300/e.glbimg.com/og/ed/f/original/2018/10/11/como-gastar-menos-no-mercado.jpg",
          height: 120,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Controle de Ocupação",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class Pessoas extends StatefulWidget {
  @override
  _PessoasState createState() => _PessoasState();
}

class _PessoasState extends State<Pessoas> {
  String _mensagem = 'Ok! Pode entrar';
  int _contador = 0;
  double _taxa = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Nº de Pessoas: $_contador',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Taxa de Ocupação: $_taxa%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Situação: $_mensagem',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "Entrou",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  onPressed: () {
                    _changeNum(1);
                  },
                  color: Colors.deepOrange,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "Saiu",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  onPressed: () {
                    _changeNum(-1);
                  },
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _changeNum(int num) {
    if (_taxa == 30 && num == 1) {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("Entrada Proibida"),
                content: new Text("Por favor, Aguarde..."),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
      return;
    }

    if (_taxa == 0 && num == -1) {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("Ops... Atenção!"),
                content: new Text("Não há pessoas no Supermercado"),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
      return;
    }

    setState(() {
      _contador += num;
      _taxa = (_contador / 20) * 100;
      if (_taxa < 30) {
        _mensagem = "Ok! Pode Entrar!";
      } else {
        _mensagem = "Entrada Proibida. Aguarde...";
      }
    });
  }
}
