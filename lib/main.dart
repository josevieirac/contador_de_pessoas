import 'package:flutter/material.dart';

//Todo programa inicia na função main
void main() {
  //Função inicial para executar a aplicação
  runApp(new MaterialApp(
      //Título da Aplicação
      title: "Contador de Pessoas",
      //Definindo a tela inicial
      home: new Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _setInfoText(){
    if(_people < 0){
      _infoText = "Mundo Invertido!";
    }else if(_people <= 30){
      _infoText = "Pode Entrar!";
    }else{
      _infoText = "Restaurante Cheio!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "imagens/restaurant.jpg",
          fit: BoxFit.cover,
          height: 2000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          _people++;
                          _setInfoText();
                        });
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          _people--;
                          _setInfoText();
                        });
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ),
          ],
        )
      ],
    );
  }
}

