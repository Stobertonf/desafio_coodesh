import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/shared/routes/routes.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomePage(
            word: '',
          ),
        ),
      ];
}
