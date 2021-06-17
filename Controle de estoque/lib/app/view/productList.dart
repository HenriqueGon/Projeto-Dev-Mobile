//@dart=2.9

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste/app/app.dart';
import 'package:teste/app/dataBase/connection.dart';

class productList extends StatelessWidget {

  Future<List<Map<String, dynamic>>> _buscarProdutos() async {
    Database db = await Connection.get();

    return db.query('produto');
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _buscarProdutos(),  
      builder: (context, futuro) {
        if (futuro.hasData) {
          var produtos = futuro.data;

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
                  title: Text('Descrição: ' + produto['descricao']),
                  subtitle: Text('Quantidade: ' + produto['quantidade'].toString()),
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
