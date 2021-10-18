
import 'dart:convert';

import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/domain/interfaces/productDao.dart';
import 'package:http/http.dart' as http;

class ProductDaoMysql implements ProductDAO {
  final uriRest = Uri.parse('http://192.168.0.106:8080/produto');

  @override
  Future<List<Product>> find() async {
    var response = await http.get(uriRest);

    if (response.statusCode == 200) throw Exception('Erro REST API.');

    Iterable listDart = json.decode(response.body);

    var listProduct = List<Product>.from(
      listDart.map((e) => Product(
        id: e['id'],
        nome: e['nome'],
        descricao: e['descricao'],
        quantidade: e['quantidade'],
      )
      )
    );

    return listProduct;
  }

  @override
  remove(id) async {
    var uri = Uri.parse('http://192.168.0.106:8080/produto/$id');
  
    var response = await http.delete(uri);

    if (response.statusCode == 200) throw Exception('Erro REST API.');
  }

  @override
  save(Product product) async {
    var headers = {
    'Content-Type': 'application/json'
    };

    var productJson = jsonEncode({
      'id': product.id,
      'nome': product.nome,
      'descricao': product.descricao,
      'quantidade': product.quantidade,
    });

    int statusCode = 0;

    if (product.id == null) {
      var response = await http.post(uriRest, headers: headers , body: productJson,);

      statusCode = response.statusCode;
    } else {
      var response = await http.put(uriRest, headers: headers, body: productJson,);

      statusCode = response.statusCode;
    }

    if (statusCode == 200) throw Exception('Erro REST API.');
  }

}