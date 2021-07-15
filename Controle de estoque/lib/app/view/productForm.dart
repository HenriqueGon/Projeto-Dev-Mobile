import 'package:flutter/material.dart';
import 'package:teste/app/view/productFormBack.dart';

class ProductForm extends StatelessWidget {

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
      initialValue: (back.product.quantidade == null) ? '0' : back.product.quantidade.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Quantidade',
      ),
    );
  }

  Widget fieldDescription(ProductFormBack back) {
    return TextFormField(
      initialValue: back.product.descricao,
      decoration: InputDecoration(
        labelText: 'Descrição',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ProductFormBack(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
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
              fieldDescription(_back),
            ],
          ),
        ),
      ),
    );
  }
}