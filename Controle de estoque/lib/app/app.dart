import 'package:flutter/material.dart';
import 'package:MyStock/app/view/adjustment/stockAdjustment.dart';
import 'package:MyStock/app/view/product/productForm.dart';
import 'package:MyStock/app/view/product/productList.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const NEWPRODUCT = 'new_product';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyStock',
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
