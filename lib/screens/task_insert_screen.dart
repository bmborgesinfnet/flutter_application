import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:location/location.dart';

class TaskInsertScreen extends StatefulWidget {
  const TaskInsertScreen({super.key});

  @override
  State<TaskInsertScreen> createState() => _TaskInsertScreenState();
}

class _TaskInsertScreenState extends State<TaskInsertScreen> {
  final _description = TextEditingController();
  final _location = TextEditingController();

  @override
  void initState() {
    super.initState();
    getLocation().then((location) {
      _location.text = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column (
          children: [
            TextField(
              controller: _description,
              decoration: const InputDecoration(
                labelText: "Descrição",
              ),
            ),
            TextField(
              controller: _location,
              decoration: const InputDecoration(
                labelText: "Localização",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Task task = Task(
                  _description.text,
                  _location.text
                );
              },
              child: const Text("Salvar"),
            ),
          ]
        ),
      ),
    );
  }


  Future<String> getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) Future.value("");
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) Future.value("");
    }
    locationData = await location.getLocation();
    return "${locationData.latitude} : ${locationData.longitude}";
  }
}
