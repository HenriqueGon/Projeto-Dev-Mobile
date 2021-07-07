//@dart=2.9
import 'package:flutter/material.dart';
import 'package:teste/app/injection.dart';

import 'app/app.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}