import 'package:flutter/material.dart';
import 'package:teste/app/view/productForm.dart';
import 'package:teste/app/view/productList.dart';

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
        HOME: (context) => productList(),
        NEWPRODUCT: (context) => productForm(),
      },
    );
  }
}
