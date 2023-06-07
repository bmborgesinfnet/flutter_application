import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/selecionar_datahora.dart';
import 'package:flutter_application_1/routes/rotas.dart';
import 'package:provider/provider.dart';
import '../models/tarefa.dart';

import '../providers/tarefa_provider.dart';
import '/views/listagem_view.dart';

class Editar extends StatefulWidget {
  Editar({super.key});
  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  double latitude = 0.0;
  double longitude = 0.0;

  var controllerTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tarefaProvider = Provider.of<TarefaProvider>(context);

    Tarefa tarefa = tarefaProvider.tarefaEditando;
    int index = tarefaProvider.indexEditando;
    tarefaProvider.dataHoraAtual = tarefa.datahora;

    if (controllerTarefa.text == "") {
      controllerTarefa.text = tarefa.nome;
    }

    tarefaProvider.retornarLocalizacao().then((locationData) {
      latitude = locationData.latitude!;
      longitude = locationData.longitude!;
    });

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Editando tarefa"),
            foregroundColor: Colors.white,
          ),
          body:
          Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Tarefa sendo editada...',
                    ),
                    controller: controllerTarefa,
                  ),
                  const SizedBox(height: 32),
                  const Text("Selecione a nova data e a hora",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  SelecionarDataHora(context),
                  const SizedBox(height: 32,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: const Text("Cancelar")),
                    ],),
                ],)
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                    onPressed: () {
                              if (controllerTarefa.text == "") {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: const Text("Digite um novo texto para a tarefa antes de editá-la."),
                                      actions: [TextButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, child: const Text("Fechar"))],
                                    );
                                  },
                                );
                              } else {
                                Tarefa tarefaEditada = tarefa;
                                tarefaEditada.nome = controllerTarefa.text;
                                tarefaEditada.datahora = tarefaProvider.dataHoraAtual;
                                tarefaEditada.longitude = longitude;
                                tarefaEditada.latitude = latitude;
                                tarefaProvider.listaTarefas[index] = tarefaEditada;
                                Navigator.pushNamedAndRemoveUntil(context, Rotas.LIST_TASK, (route) => false);
                              }
                            },
                    backgroundColor: Colors.green,
                    //tooltip: 'Adicionar nova tarefa',
                    label: Icon(Icons.save, color: Colors.white),
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text("Deseja mesmo deletar essa tarefa?"),
                              actions: [ElevatedButton(
                                onPressed: () => Navigator.pop(context, false), // passing false
                                child: const Text('Não'),
                              ),
                                ElevatedButton(
                                  onPressed: () {
                                    tarefaProvider.listaTarefas.removeAt(index);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Listagem()),
                                            (Route<dynamic> route) => false);
                                  }, // passing true
                                  child: const Text('Sim'),
                                ),],
                            );
                          },
                        );
                      },
                    backgroundColor: Colors.red,
                    //tooltip: 'Adicionar nova tarefa',
                    label: Icon(Icons.delete, color: Colors.white),
                )
              ],
            ),),
        )
    );
  }
}
