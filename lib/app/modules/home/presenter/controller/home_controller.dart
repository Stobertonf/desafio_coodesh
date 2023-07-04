import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repositories/words_repository.dart';
import 'package:desafio_coodesh/app/modules/home/domain/usercases/save_word_usercase.dart';

@Injectable()
class HomeController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  TextEditingController? textHelpController;
  late final SaveWordsUseCase customerUseCase;
  late final IWordsRepository customerRepository;

  HomeController(this.customerUseCase, this.customerRepository);

  Future<Either<Failure, String>> saveCustomer({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) async {
    var result = await customerUseCase.call(
      word: word,
      results: results,
      syllables: syllables,
      pronunciation: pronunciation,
      frequency: frequency,
    );

    try {
      Future<Either<Failure, String>> retorno = result.fold((l) async {
        return Left(l);
      }, (r) async {
        return Right(r);
      });
      return retorno;
    } catch (e) {
      rethrow;
    }
  }

  String? validateWord(String? value) {
    RegExp onlyLetters = RegExp(r'^[a-zA-Z~ ]+$');
    if (value == null || value.isEmpty) {
      return 'Por favor, digite a palavra.';
    } else if (!onlyLetters.hasMatch(value)) {
      return 'A palavra só pode conter letras';
    } else if (value.length > 98) {
      return 'O palavra deve ter no máximo 98 caracteres.';
    }
    return null;
  }
}
