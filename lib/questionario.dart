import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int index;
  final void Function(int) quandoResponder;

  bool get temPerguntaSelecionada {
    return index < perguntas.length;
  }

  const Questionario(this.perguntas, this.index, this.quandoResponder,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPerguntaSelecionada ? perguntas[index].cast()['respostas'] : [];
    List<Widget> listaRespostas = respostas.map((resp) {
      return Resposta(resp['texto'].toString(),
          () => quandoResponder(int.parse(resp['pontuacao'].toString())));
    }).toList();

    return Column(
      children: <Widget>[
        Questao(
          perguntas[index]['texto'].toString(),
        ),
        //...Pega cada elemento da lista e adiciona nessa lista de widgets
        ...listaRespostas,
      ],
    );
  }
}
