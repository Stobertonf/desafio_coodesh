import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';

@Injectable()
abstract class WordsApiRepository {
  Future<Map<String, dynamic>> getWordDetails(String word);
}

class HomeRepositoryImpl implements WordsApiRepository {
  final String baseUrl = "https://wordsapiv1.p.mashape.com/words";

  @override
  Future<Map<String, dynamic>> getWordDetails(String word) async {
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
}
