import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String,Object>> _perguntas = const [
    {
      'texto' : 'Qual é a sua cor favorita?',
      'respostas' : [
        {'texto' : 'Preto', 'pontuacao' : 10},
        {'texto' : 'Vermelho', 'pontuacao' : 5},
        {'texto' : 'Verde', 'pontuacao' : 3},
        {'texto' : 'Branco', 'pontuacao' : 1},
      ],
    },
    {
      'texto' : 'Qual é seu animal favorito?',
       'respostas' : [
        {'texto' : 'Coelho', 'pontuacao' : 10},
        {'texto' : 'Cobra', 'pontuacao' : 5},
        {'texto' : 'Elefante', 'pontuacao' : 3},
        {'texto' : 'Leão', 'pontuacao' : 1},
      ],
    },
    {
      'texto' : 'Qual é seu instrutor favorito?',
       'respostas' : [
        {'texto' : 'Maria', 'pontuacao' : 10},
        {'texto' : 'João', 'pontuacao' : 5},
        {'texto' : 'Leo', 'pontuacao' : 3},
        {'texto' : 'Pedro', 'pontuacao' : 1},
       ],
    },
  ];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada) {
          setState(() {
          _perguntaSelecionada++;  
        });
        print(_perguntaSelecionada);
          _pontuacaoTotal += pontuacao;
        }

        print('PontuacaoTotal:' + _pontuacaoTotal.toString());  
    }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

    
  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
   
  //  List<Widget> widgets = [];

  //  for (var textoResp in respostas){
  //   widgets.add(Resposta(textoResp, _responder));
  //  }
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntassss'),
        ),
        body: temPerguntaSelecionada
         ? Questionario(
           perguntas: _perguntas,
           perguntaSelecionada: _perguntaSelecionada,
           quandoResponder: _responder)
        : Resultado(_pontuacaoTotal, _reiniciarQuestionario)
      ),
    );
  }

}

class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState(){
    return new _PerguntaAppState();
  }

} 