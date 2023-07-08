import 'package:dartz/dartz.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, String>> saveWord({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  });

  Future<Either<Failure, String>> listWords({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  });

  Future<Either<Failure, String>> getWords({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  });
}
