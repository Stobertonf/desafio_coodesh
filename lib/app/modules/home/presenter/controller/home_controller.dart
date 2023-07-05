import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';
import 'package:desafio_coodesh/app/modules/home/infra/models/word_details_model.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repository/home_repository.dart';
import 'package:desafio_coodesh/app/modules/home/domain/usercases/save_word_usercase.dart';

@Injectable()
class HomeController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  WordDetailsModel? _wordDetails;
  TextEditingController? textHelpController;
  late final IWordsRepository wordsRepository;
  late final SaveWordsUseCase saveWordsUseCase;

  HomeController(
    this.saveWordsUseCase,
    this.wordsRepository,
  );

  Future<Either<Failure, String>> saveWords({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) async {
    var result = await saveWordsUseCase.call(
      word: word,
      results: results,
      syllables: syllables,
      pronunciation: pronunciation,
      frequency: frequency,
    );

    return result;
  }

  Future<WordDetailsModel?> getWordDetails({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) async {
    final result = await saveWordsUseCase.call(
      word: word,
      results: results,
      syllables: syllables,
      pronunciation: pronunciation,
      frequency: frequency,
    );

    return result.fold(
      (failure) {
        print("Falha ao capturar palavra: $failure");
        return null;
      },
      (wordDetails) =>
          Future.value(wordDetails as FutureOr<WordDetailsModel?>?),
    );
  }

  String? validateWord(String? value) {
    RegExp onlyLetters = RegExp(r'^[a-zA-Z~ ]+$');
    if (value == null || value.isEmpty) {
      return 'Por favor, digite a palavra.';
    } else if (!onlyLetters.hasMatch(value)) {
      return 'A palavra só pode conter letras';
    } else if (value.length > 98) {
      return 'A palavra deve ter no máximo 98 caracteres.';
    }
    return null;
  }

  WordDetailsModel? get wordDetails => _wordDetails;
}
