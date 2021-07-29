import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/view/product/productDetailsBack.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _back = ProductDetailsBack(context);
    Product product = _back.product;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: (
                  Text("${product.nome}", style: TextStyle(fontSize: 25))
                ),
              ),
              Center(
                child: (Text("Informações do produto", style: TextStyle(fontSize: 20))),
              ),
              Card(
                child: ListTile(
                  title: Text("Quantidade em estoque"),
                  subtitle: Text("${product.quantidade}"),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Descrição"),
                  subtitle: Text("${product.descricao}"),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _back.goToBack();
            },
            child: Icon(Icons.arrow_back),
          ),
        );
      }
    );
  }
}