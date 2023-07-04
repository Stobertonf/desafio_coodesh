import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repository/words_repository.dart';

@Injectable()
class SaveWordsUseCase {
  final IWordsRepository repository;

  SaveWordsUseCase(this.repository);

  Future<Either<Failure, String>> call({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) async {
    return await repository.saveWord(
      word: word,
      results: results,
      syllables: syllables,
      pronunciation: pronunciation,
      frequency: frequency,
    );
  }
}
