import 'package:dartz/dartz.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';
import 'package:desafio_coodesh/app/modules/home/external/data/remote/home_datasource_impl.dart';

abstract class HomeDataSource {
  HomeDataSource(HomeDataSourceImpl homeDataSourceImpl);

  Future<Either<Failure, Map<String, dynamic>>> saveWords();
  Future<Either<Failure, Map<String, dynamic>>> listWords();
  Future<Either<Failure, Map<String, dynamic>>> getWordDetails();
}
