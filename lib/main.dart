import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/routes/route_paths.dart';
import 'package:flutter_application_1/screens/product_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'screens/product_insert_screen.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(App());
}


class App extends StatelessWidget {
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ProductListScreen(_products),
      routes: {
        RoutePaths.HOME: (context) => ProductListScreen(),
        RoutePaths.PRODUCTSHOWSCREEN: (context) => ProductShowScreen(),
        RoutePaths.PRODUCTINSERTSCREEN: (context) => ProductInsertScreen(),
      }
    );
  }
}
