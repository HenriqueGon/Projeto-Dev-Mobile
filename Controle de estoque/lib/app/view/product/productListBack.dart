//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:MyStock/app/app.dart';
import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/domain/services/productService.dart';
import 'package:url_launcher/url_launcher.dart';

part 'productListBack.g.dart'; 

class ProductListBack = _ProductListBack with _$ProductListBack;

abstract class _ProductListBack with Store {
  BuildContext context;
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
    Navigator.of(context).pushNamed(MyApp.NEW_PRODUCT, arguments: product).then(refreshList);
  }

  goToDetails(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(MyApp.PRODUCT_DETAILS, arguments: product);
  }

  remove(int id) {
    _service.remove(id);

    refreshList();
  }

  _launchApp(String url, Function(BuildContext context) modalError) async {
    await canLaunch(url) ? await launch(url) : modalError(context);
  } 

  launchEmail(Function(BuildContext context) modalError) async {
    await _launchApp('mailto: henriquegon.o@hotmail.com', modalError);
  }
}