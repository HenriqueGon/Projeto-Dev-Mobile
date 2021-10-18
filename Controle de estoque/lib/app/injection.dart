import 'package:MyStock/app/dataBase/mysql/productDaoMysql.dart';
import 'package:MyStock/app/dataBase/sqlite/daos/productDaoImpl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:MyStock/app/domain/interfaces/productDao.dart';
import 'package:MyStock/app/domain/services/productService.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<ProductDAO>(ProductDaoMysql());
  getIt.registerSingleton<ProductService>(ProductService());
}