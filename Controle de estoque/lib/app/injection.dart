
import 'package:get_it/get_it.dart';
import 'package:teste/app/dataBase/daos/productDaoImpl.dart';
import 'package:teste/app/domain/interfaces/productDao.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ProductDAO>(ProductDAOImpl());
}