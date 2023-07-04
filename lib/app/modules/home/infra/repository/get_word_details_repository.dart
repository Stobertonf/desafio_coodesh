import 'package:dartz/dartz.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';

abstract class IGetWordDetailsRepository {
  Future<Either<Failure, String>> saveWords({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  });
}