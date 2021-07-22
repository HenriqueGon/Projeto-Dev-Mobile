//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:MyStock/app/app.dart';
import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/domain/services/productService.dart';

part 'productListBack.g.dart'; 

class ProductListBack = _ProductListBack with _$ProductListBack;

abstract class _ProductListBack with Store {
  var _service = GetIt.I.get<ProductService>();
  
  @observable
  Future<List<Product>> list;

  _ProductListBack() {
    refreshList();
  }

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  goToForm(BuildContext context, [Product product]) {
    Navigator.of(context).pushNamed(MyApp.NEWPRODUCT, arguments: product).then(refreshList);
  }

  remove(int id) {
    _service.remove(id);

    refreshList();
  } 
}