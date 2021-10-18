//@dart=2.9
import 'package:flutter/material.dart';
import 'package:MyStock/app/view/product/productFormBack.dart';

class ProductForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(ProductFormBack back) {
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue) => back.product.nome = newValue,
      initialValue: back.product.nome,
      decoration: InputDecoration(
        labelText: 'Nome',
      ),
    );
  }

  Widget fieldQuantity(ProductFormBack back) {
    return TextFormField(
      validator: back.validateQuantity,
      onSaved: (newValue) => back.product.quantidade = newValue,
      initialValue: back.product.quantidade,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Quantidade',
      ),
    );
  }

  Widget fieldDescription(ProductFormBack back) {
    return TextFormField(
      validator: back.validateDescription,
      onSaved: (newValue) => back.product.descricao = newValue,
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
          IconButton(
            onPressed: (){
              _form.currentState.validate();
              _form.currentState.save();

              if (_back.isValid) {
                _back.save(context);
              }
            }, 
            icon: Icon(Icons.save)
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
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