
import 'package:MyStock/app/dataBase/firestore/daos/productDaoFirestore.dart';
import 'package:MyStock/app/dataBase/sqlite/daos/productDaoImpl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:MyStock/app/domain/interfaces/productDao.dart';
import 'package:MyStock/app/domain/services/productService.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<ProductDAO>(ProductDAOFirestore());
  getIt.registerSingleton<ProductService>(ProductService());
}