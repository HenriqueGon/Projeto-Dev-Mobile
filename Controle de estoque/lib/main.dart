//@dart=2.9
import 'package:flutter/material.dart';
import 'package:MyStock/app/injection.dart';

import 'app/app.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}