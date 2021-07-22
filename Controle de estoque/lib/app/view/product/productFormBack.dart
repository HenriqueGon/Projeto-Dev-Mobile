//@dart=2.9

import 'package:MyStock/app/domain/services/productService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:MyStock/app/domain/entities/product.dart';

part 'productFormBack.g.dart';

class ProductFormBack = _ProductFormBack with _$ProductFormBack;

abstract class _ProductFormBack with Store {
  Product product;

  var _service = GetIt.I.get<ProductService>();

  bool _nameIsValid;
  bool _quantityIsValid;
  bool _descriptionIsValid;
  
  _ProductFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;

    product = (parameter == null) ? Product() : parameter;
  }

  @action
  bool get isValid => _nameIsValid && _quantityIsValid && _descriptionIsValid;
  
  save() async {
    await _service.save(product);
  }

  String validateName(String name) {
    try {
      _service.validateName(name);

      _nameIsValid = true;

      return null;
    } catch(e) {
      _nameIsValid = false;

      return e.toString();
    }
  }

  String validateQuantity(String quantity) {
    try {
      _service.validateQuantity(quantity);

      _quantityIsValid = true;

      return null;
    } catch (e) {
      _quantityIsValid = false;

      return e.toString();
    }
  }

  String validateDescription(String description) {
    try {
      _service.validateDescription(description);

      _descriptionIsValid = true;

      return null;
    } catch (e) {
      _descriptionIsValid = false;

      return e.toString();
    }
  }
}