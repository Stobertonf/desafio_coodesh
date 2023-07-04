import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio_coodesh/app/modules/home/infra/models/word_details_model.dart';
import 'package:desafio_coodesh/app/modules/home/presenter/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final String word;

  const HomePage({Key? key, required this.word}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    controller.getWordDetails(
      word: word,
      results: "",
      syllables: "",
      pronunciation: "",
      frequency: "",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Word Details",
        ),
      ),
      body: Center(
        child: FutureBuilder<WordDetailsModel>(
          future: controller.wordDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final wordDetails = snapshot.data!;

              return Text(wordDetails.toString());
            } else {
              return const Text("No data");
            }
          },
        ),
      ),
    );
  }
}
