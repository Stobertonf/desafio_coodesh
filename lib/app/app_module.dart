import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/home/home_module.dart';
import 'modules/home/external/data/remote/home_datasource_impl.dart';
import 'modules/home/infra/repository/home_repository_impl.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repository/home_repository.dart';
import 'package:desafio_coodesh/app/modules/home/domain/usercases/save_word_usercase.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/controller/home_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => SaveWordsUseCase(i.get<HomeRepositoryImpl>())),
        Bind.singleton((i) => HomeController(
              i.get<SaveWordsUseCase>(),
              i.get<HomeRepositoryImpl>(),
            )),
        Bind.singleton((i) => HomeDataSourceImpl(i.get<HomeRepositoryImpl>())),
        Bind.singleton((i) => HomeRepositoryImpl(i.get<HomeDataSourceImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: HomeModule(),
        ),
      ];
}
