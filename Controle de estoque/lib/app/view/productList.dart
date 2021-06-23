//@dart=2.9

import 'package:flutter/material.dart';
import 'package:teste/app/app.dart';
import 'package:teste/app/dataBase/daos/productDaoImpl.dart';
import 'package:teste/app/domain/entities/product.dart';

class productList extends StatelessWidget {

  Future<List<Product>> _buscarProdutos() async {
    return ProductDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _buscarProdutos(),  
      builder: (context, futuro) {
        if (futuro.hasData) {
          List<Product> produtos = futuro.data;

          return Scaffold(
            appBar: AppBar(
              title: Text('Lista de Produtos'),
              actions: [
                IconButton(
                  onPressed: () => {
                    Navigator.of(context).pushNamed(MyApp.NEWPRODUCT),
                  }, 
                  icon: Icon(Icons.add)
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, i) {
                var produto = produtos[i];

                return ListTile(
                  title: Text('Descrição: ' + produto.descricao),
                  subtitle: Text('Quantidade: ' + produto.quantidade.toString()),
                );
              },
            )
          );
        } else {
          return Scaffold();
        }
      },
    );
    
  }
}
