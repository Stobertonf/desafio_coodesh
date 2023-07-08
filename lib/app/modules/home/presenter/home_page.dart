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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Word Details"),
      ),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: controller.getWordDetails(
            word: word,
            results: "",
            syllables: "",
            pronunciation: "",
            frequency: "",
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error ?? 'Unknown error'}");
            } else if (snapshot.hasData) {
              final wordList = snapshot.data!;
              if (wordList.isEmpty) {
                return const Text("No data");
              } else {
                return ListView.builder(
                  itemCount: wordList.length,
                  itemBuilder: (context, index) {
                    final word = wordList[index];
                    return ListTile(
                      title: Text(word),
                    );
                  },
                );
              }
            } else {
              return const Text("No data");
            }
          },
        ),
      ),
    );
  }
}
