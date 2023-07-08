import 'package:dartz/dartz.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';
import 'package:desafio_coodesh/app/modules/home/infra/data/home_datasource.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;
  HomeRepositoryImpl(this._homeDataSource);

  Future<Either<Failure, String>> saveWords({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> listWords({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> saveWord({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getWords({
    required String word,
    required String results,
    required String syllables,
    required String pronunciation,
    required String frequency,
  }) {
    throw UnimplementedError();
  }
}
