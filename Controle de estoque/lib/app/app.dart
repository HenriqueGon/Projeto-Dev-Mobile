import 'package:flutter/material.dart';
import 'package:teste/app/view/ProductForm.dart';
import 'package:teste/app/view/ProductList.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const NEWPRODUCT = 'new_product';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => ProductList(),
        NEWPRODUCT: (context) => ProductForm(),
      },
    );
  }
}
