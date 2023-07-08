import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/core/failure.dart';
import 'package:desafio_coodesh/app/modules/home/infra/data/home_datasource.dart';
import 'package:desafio_coodesh/app/modules/home/domain/repository/home_repository.dart';

@Injectable()
class HomeDataSourceImpl extends HomeDataSource {
  final String baseUrl = "https://wordsapiv1.p.mashape.com/words";

  HomeDataSourceImpl(HomeRepository homeRepository)
      : super(homeRepository as HomeDataSourceImpl);

  Future<Map<String, dynamic>> wordDetails(String word) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$word'),
      headers: {
        'X-Mashape-Key': 'YOUR_API_KEY',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> listWords() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'X-Mashape-Key': 'YOUR_API_KEY',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      return Left(
        Failure(message: "Failed to load data"),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> saveWords() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'X-Mashape-Key': 'YOUR_API_KEY',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      return Left(
        Failure(message: "Failed to load data"),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getWordDetails() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'X-Mashape-Key': 'YOUR_API_KEY',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      return Left(
        Failure(message: "Failed to load data"),
      );
    }
  }
}
