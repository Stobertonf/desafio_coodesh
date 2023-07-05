import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/home/home_module.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repository/home_repository.dart';
import 'package:desafio_coodesh/app/modules/home/domain/usercases/save_word_usercase.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/controller/home_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeController(
            i.get<SaveWordsUseCase>(), i.get<IWordsRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];
}
