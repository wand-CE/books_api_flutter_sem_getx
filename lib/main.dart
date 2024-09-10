import 'package:books_api_flutter_sem_getx/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: AppRoutes.homePage,
    routes: AppRoutes.define(),
    debugShowCheckedModeBanner: false,
  ));
}
