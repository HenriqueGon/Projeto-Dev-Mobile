//@dart=2.9
import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/domain/interfaces/productDao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDAOFirestore implements ProductDAO {

  CollectionReference productCollection;

  ProductDAOFirestore() {
    productCollection = FirebaseFirestore.instance.collection('product');
  }

  @override
  Future<List<Product>> find() async {
    var result = await productCollection.get();

    return result.docs.map((doc) => 
      Product(
        id: doc.reference.id.toString(),
        nome: doc['nome'],
        descricao: doc['descricao'],
        quantidade: doc['quantidade'],
      )
    ).toList();
  }

  @override
  remove(id) {
    productCollection.doc(id).delete();
  }

  @override
  save(Product product) {
    productCollection.doc(product.id).set({
      'nome': product.nome,
      'descricao': product.descricao,
      'quantidade': product.quantidade,
    });
  }
}