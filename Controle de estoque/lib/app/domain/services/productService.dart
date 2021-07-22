//@dart=2.9
import 'package:get_it/get_it.dart';
import 'package:MyStock/app/domain/entities/product.dart';
import 'package:MyStock/app/domain/exception/DomainLayerException.dart';
import 'package:MyStock/app/domain/interfaces/productDao.dart';

class ProductService {
  var _dao = GetIt.I.get<ProductDAO>();

  save(Product product) {
    validateName(product.nome);
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

  validateName(String name) {
    var max = 50;

    if (name.length == 0) {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (name.length > max) {
      throw new DomainLayerException('A descrição deve possuir no máximo $max caracteres.');
    }
  }
   
  validateDescription(String description) {
    var max = 255;
    
    if (description.length > max) {
      throw new DomainLayerException('A descrição deve possuir no máximo $max caracteres.');
    }
  }

  validateQuantity(String quantity) {
    if (quantity.length == 0) {
      throw new DomainLayerException('A quantidade é obrigatório.');
    }
  }

}