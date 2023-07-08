import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String? word;
  final List<Definition>? results;
  final Syllables? syllables;
  final Pronunciation? pronunciation;
  final double? frequency;

  const HomeEntity({
    required this.word,
    required this.results,
    required this.syllables,
    this.pronunciation,
    required this.frequency,
  });

  @override
  List<Object?> get props =>
      [word, results, syllables, pronunciation, frequency];
}

class Definition {
  final String? definition;
  final String? partOfSpeech;
  final List<String>? synonyms;
  final List<String>? typeOf;
  final List<String>? hasTypes;
  final List<String>? derivation;
  final List<String>? examples;

  Definition({
    this.definition,
    this.partOfSpeech,
    this.synonyms,
    this.typeOf,
    this.hasTypes,
    this.derivation,
    this.examples,
  });
}

class Syllables {
  final int? count;
  final List<String>? list;

  Syllables({
    this.count,
    this.list,
  });
}

class Pronunciation {
  final String? all;

  Pronunciation({
    this.all,
  });
}
