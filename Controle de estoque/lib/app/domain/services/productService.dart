//@dart=2.9
import 'package:get_it/get_it.dart';
import 'package:teste/app/domain/entities/product.dart';
import 'package:teste/app/domain/exception/domainLayerException.dart';
import 'package:teste/app/domain/interfaces/productDao.dart';

class ProductService {
  var _dao = GetIt.I.get<ProductDAO>();

  save(Product product) {
    validateDescription(product.descricao);
    validateQuantity(product.quantidade);

    _dao.save(product);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Product>> find() {
    return _dao.find();
  }

  validateDescription(String description) {
    var min = 3;
    var max = 255;

    if (description == null) {
      throw new domainLayerException('A descrição é obrigatório.');
    } else if (description.length < min) {
      throw new domainLayerException('A descrição deve possuir ao menos $min caracteres.');
    } else if (description.length > max) {
      throw new domainLayerException('A descrição deve possuir no máximo $max caracteres.');
    }
  }

  validateQuantity(int quantity) {
    if (quantity == null) {
      throw new domainLayerException('A quantidade é obrigatório.');
    }
  } 
}