//@dart = 2.9
import 'package:MyStock/app/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsBack {
  BuildContext context;
  Product product;

  ProductDetailsBack(this.context) {
    product = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}