import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/selecionar_datahora.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/tarefa_provider.dart';
import '../models/tarefa.dart';
import 'listagem_view.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});
  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  double latitude = 0.0;
  double longitude = 0.0;
  final controllerTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tarefaProvider = Provider.of<TarefaProvider>(context);

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
            title: const Text("Cadastrar nova tarefa"),
            foregroundColor: Colors.white,
          ),
          body:
          Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text("Digite a tarefa",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Descrição nova tarefa',
                    ),
                    controller: controllerTarefa,
                  ),
                  const SizedBox(height: 32),
                  const Text("Selecione a data e a hora",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  SelecionarDataHora(context),
                  const SizedBox(height: 32,),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: const Text("Cancelar",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    const SizedBox(width: 16),
                  ],)
                ],)
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                      if (controllerTarefa.text.length == 0) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text("Digite uma tarefa antes de cadastrá-la."),
                              actions: [TextButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: const Text("Fechar"))],
                            );
                          },
                        );
                      } else {
                        tarefaProvider.listaTarefas.add(Tarefa(controllerTarefa.text, tarefaProvider.dataHoraAtual, latitude, longitude)
                        );
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Listagem()),
                                (Route<dynamic> route) => false);
                      }
                    },
              backgroundColor: Colors.green,
              //tooltip: 'Adicionar nova tarefa',
              label: Icon(Icons.save, color: Colors.white),
          ),
        )
    );
  }
  Future<DateTime?> pegarData(context, dateTime) => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100)
  );

  Future<TimeOfDay?> pegarHorario(context, dateTime) => showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: dateTime.hour,
          minute: dateTime.minute)
  );
}