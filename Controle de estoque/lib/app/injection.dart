
import 'package:get_it/get_it.dart';
import 'package:MyStock/app/dataBase/daos/productDaoImpl.dart';
import 'package:MyStock/app/domain/interfaces/productDao.dart';
import 'package:MyStock/app/domain/services/productService.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ProductDAO>(ProductDAOImpl());
  getIt.registerSingleton<ProductService>(ProductService());
}