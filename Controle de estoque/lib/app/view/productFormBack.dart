//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:teste/app/domain/entities/product.dart';

part 'productFormBack.g.dart';

class ProductFormBack = _ProductFormBack with _$ProductFormBack;

abstract class _ProductFormBack with Store {
  Product product;
  
  _ProductFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;

    product = (parameter == null) ? Product() : parameter;
  }

}