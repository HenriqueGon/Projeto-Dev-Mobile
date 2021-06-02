import 'package:flutter/material.dart';
import 'package:teste/app/app.dart';

class productList extends StatefulWidget {

  @override
  _productListState createState() => _productListState();
}

class _productListState extends State<productList> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView()
    );
  }
}