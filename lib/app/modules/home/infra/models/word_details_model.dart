class WordDetailsModel {
  final String word;
  final double frequency;
  final Syllables syllables;
  final Pronunciation pronunciation;
  final List<Definition> results;

  WordDetailsModel({
    required this.word,
    required this.results,
    required this.syllables,
    required this.pronunciation,
    required this.frequency,
  });

  factory WordDetailsModel.fromJson(Map<String, dynamic> json) {
    return WordDetailsModel(
      word: json['word'],
      results: List<Definition>.from(
        json['results'].map((result) => Definition.fromJson(result)),
      ),
      syllables: Syllables.fromJson(json['syllables']),
      pronunciation: Pronunciation.fromJson(json['pronunciation']),
      frequency: json['frequency']?.toDouble() ?? 0.0,
    );
  }
}

class Definition {
  final String definition;
  final String partOfSpeech;
  final List<String> synonyms;
  final List<String> typeOf;
  final List<String> hasTypes;
  final List<String> derivation;
  final List<String> examples;

  Definition({
    required this.definition,
    required this.partOfSpeech,
    required this.synonyms,
    required this.typeOf,
    required this.hasTypes,
    required this.derivation,
    required this.examples,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json['definition'],
      partOfSpeech: json['partOfSpeech'],
      synonyms: List<String>.from(json['synonyms']),
      typeOf: List<String>.from(json['typeOf']),
      hasTypes: List<String>.from(json['hasTypes']),
      derivation: List<String>.from(json['derivation']),
      examples: List<String>.from(json['examples']),
    );
  }
}

class Syllables {
  final int count;
  final List<String> list;

  Syllables({
    required this.count,
    required this.list,
  });

  factory Syllables.fromJson(Map<String, dynamic> json) {
    return Syllables(
      count: json['count'],
      list: List<String>.from(
        json['list'],
      ),
    );
  }
}

class Pronunciation {
  final String all;

  Pronunciation({
    required this.all,
  });

  factory Pronunciation.fromJson(Map<String, dynamic> json) {
    return Pronunciation(
      all: json['all'],
    );
  }
}
