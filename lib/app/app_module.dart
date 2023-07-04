import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];
}
