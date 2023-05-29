import 'package:flutter_application_1/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:location/location.dart';

class ProductInsertScreen extends StatefulWidget {
  const ProductInsertScreen({super.key});

  @override
  State<ProductInsertScreen> createState() => _ProductInsertScreenState();
}

class _ProductInsertScreenState extends State<ProductInsertScreen> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _location = TextEditingController();
  final _imageUrl = TextEditingController();
  final _quant = TextEditingController();

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
        title: const Text("Cadastro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
            ),
            TextField(
              controller: _price,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Preço",
              ),
            ),
            TextField(
              controller: _location,
              decoration: const InputDecoration(
                labelText: "Localização",
              ),
            ),
            TextField(
              controller: _imageUrl,
              decoration: const InputDecoration(
                labelText: "URL da imagem",
              ),
            ),
            TextField(
              controller: _quant,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantidade",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Product product = Product(
                  _name.text,
                  double.parse(_price.text),
                  _location.text,
                  _imageUrl.text,
                  int.parse(_quant.text),
                );
              },
              child: const Text("Salvar"),
            ),
          ],
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
