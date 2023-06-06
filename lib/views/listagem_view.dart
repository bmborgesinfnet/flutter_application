import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/botao_nova_tarefa.dart';
import 'package:flutter_application_1/components/listagem_tarefas.dart';

class Listagem extends StatelessWidget {

  const Listagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de tarefas"),
      ),
      body: const ListagemTarefas(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const BotaoAdicionarTarefa()
      );
  }
}
