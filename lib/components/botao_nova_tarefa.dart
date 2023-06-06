import 'package:flutter/material.dart';
import '../routes/rotas.dart';

class BotaoAdicionarTarefa extends StatelessWidget {
  const BotaoAdicionarTarefa({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    adicionarNovaTarefa() {
      Navigator.of(context).pushNamed(Rotas.CREATE_TASK);
    }

    return FloatingActionButton.extended(
        onPressed: adicionarNovaTarefa,
        backgroundColor: Colors.green,
        //tooltip: 'Adicionar nova tarefa',
        label: Icon(Icons.add, color: Colors.white),
    );
  }
}
