import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/home_page.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/controller/home_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(
              i.get(),
              i.get(),
            )),
        /* Bind((i) => HomeUseCase(i.get())),
        Bind((i) => HomeDataSource(i.get())),
        Bind((i) => IHomeRepository(i.get())),*/
      ];

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
