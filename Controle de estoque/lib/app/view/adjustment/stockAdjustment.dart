import 'package:flutter/material.dart';
import 'package:MyStock/app/view/product/productFormBack.dart';

class StockAdjustment extends StatelessWidget {
  Widget fieldName(ProductFormBack back) {
    return TextFormField(
      initialValue: back.product.nome,
      decoration: InputDecoration(
        labelText: 'Nome',
      ),
    );
  }

  Widget fieldQuantity(ProductFormBack back) {
    return TextFormField(
      initialValue: back.product.quantidade,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Quantidade',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ProductFormBack(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuste de Estoque'),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              fieldName(_back),
              fieldQuantity(_back),
            ],
          ),
        ),
      ),
    );
  }
}
