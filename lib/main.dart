import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/tarefa_provider.dart';
import 'package:flutter_application_1/views/cadastrar_view.dart';
import 'package:flutter_application_1/views/editar_view.dart';
import 'package:provider/provider.dart';
import 'views/listagem_view.dart';
import 'routes/rotas.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TarefaProvider(),
      child: MaterialApp(
        title: 'Cadastro de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        // home: const Listagem(),
        debugShowCheckedModeBanner: false,
        routes: {
          Rotas.LIST_TASK: (context) => const Listagem(),
          Rotas.CREATE_TASK: (context) => const Cadastrar(),
          Rotas.EDIT_TASK: (context) => Editar(),
        }

      ),
    );
  }
}