import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/home_page.dart';
import 'package:desafio_coodesh/app/modules/home/infra/data/home_datasource.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repository/home_repository.dart';
import 'package:desafio_coodesh/app/modules/home/domain/usercases/save_word_usercase.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/controller/home_controller.dart';
import 'package:desafio_coodesh/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:desafio_coodesh/app/modules/home/external/data/remote/home_datasource_impl.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => SaveWordsUseCase(i.get<HomeRepository>())),
        Bind.singleton((i) => HomeController(
              i.get<SaveWordsUseCase>(),
              i.get<HomeRepository>(),
            )),
        Bind.singleton((i) => HomeRepositoryImpl(i.get<HomeDataSource>())),
        Bind((i) => HomeDataSourceImpl(i.get())),
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
