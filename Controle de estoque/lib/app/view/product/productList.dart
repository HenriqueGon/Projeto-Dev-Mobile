//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/view/product/productListBack.dart';

class ProductList extends StatelessWidget {

  final _back = ProductListBack();

  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Atenção!'),
      content: Text('Não foi possível encontrar um aplicativo compatível!'),
    );

    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return alert;
      }
    );
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
      onPressed: onPressed, 
      color: Colors.blue, 
      icon: Icon(Icons.edit)
    );
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirma a exclusão?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text('Cancelar')
              ),
              TextButton(
                onPressed: remove, 
                child: Text('Confirmar')
              ),
            ],
          )
        );
      }, 
      icon: Icon(Icons.delete),
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        actions: [
          IconButton(
            onPressed: () => {
              _back.goToForm(context),
            }, 
            icon: Icon(Icons.add)
          ),
        ],
      ),
      body: Observer(builder: (context){
        return FutureBuilder(
        future: _back.list,  
        builder: (context, futuro) {
          if (!futuro.hasData) {
            return CircularProgressIndicator();
          } else {
            List<Product> produtos = futuro.data;

            return ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, i) {
                var produto = produtos[i];

                return ListTile(
                  title: Text('Nome: ' + produto.nome),
                  subtitle: Text('Quantidade: ' + produto.quantidade),
                  onTap: () {
                    _back.goToDetails(context, produto);
                  },
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        iconEditButton((){
                          _back.goToForm(context, produto);
                        }),
                        iconRemoveButton(context, () {
                          _back.remove(produto.id);

                          Navigator.of(context).pop();
                        }),
                      ],
                    )
                  ),
                );
              },
            );
          }
        });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _back.launchEmail(showModalError);
        },
        child: Icon(Icons.email),
      ),
    );
  }
}
