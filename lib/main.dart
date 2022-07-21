import 'package:checkitout/app.dart';
import 'package:checkitout/providers.dart';
//import 'package:checkitout/repositories/categories_repository.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const App(),
  ));
}
