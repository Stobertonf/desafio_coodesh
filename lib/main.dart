import 'package:flutter/material.dart';
import 'package:desafio_coodesh/app/app_module.dart';
import 'package:desafio_coodesh/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
