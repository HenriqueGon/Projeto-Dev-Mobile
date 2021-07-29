//@dart=2.9

import 'package:sqflite/sqflite.dart';
import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/domain/interfaces/productDao.dart';

import '../connection.dart';

class ProductDAOImpl implements ProductDAO{

  Database db;

  @override
  Future<List<Product>> find() async {
    db = await Connection.get();

    List<Map<String, dynamic>> result = await db.query('produto');

    List<Product> products = List.generate(result.length, (i) {
      var row = result[i];

      return Product(
        id: row['id'],
        nome: row['nome'],
        descricao: row['descricao'],
        quantidade: row['quantidade']
      );
    });
    
    return products;
  }

  @override
  remove(int id) async {
    db = await Connection.get();

    var sql = 'DELETE FROM produto WHERE id = ?';

    db.rawDelete(sql, [id]);
  }

  @override
  save(Product product) async {
    db = await Connection.get();

    var sql;

    if (product.id == null) {
      sql = 'INSERT INTO produto (nome, descricao, quantidade) VALUES (?, ?, ?)';

      db.rawInsert(sql, [product.nome, product.descricao, product.quantidade]);
    } else {
      sql = '''UPDATE produto SET
        nome = ? 
        ,descricao = ?
        ,quantidade = ?
        WHERE id = ?
      ''';

      db.rawUpdate(sql, [product.nome, product.descricao, product.quantidade, product.id]);
    }
  }

}