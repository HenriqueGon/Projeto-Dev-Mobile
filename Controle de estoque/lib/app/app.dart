import 'package:MyStock/app/view/product/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:MyStock/app/view/adjustment/stockAdjustment.dart';
import 'package:MyStock/app/view/product/productForm.dart';
import 'package:MyStock/app/view/product/productList.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const NEW_PRODUCT = 'new_product';
  static const PRODUCT_DETAILS = 'product-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyStock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => ProductList(),
        NEW_PRODUCT: (context) => ProductForm(),
        PRODUCT_DETAILS: (context) => ProductDetails(),
      },
    );
  }
}
