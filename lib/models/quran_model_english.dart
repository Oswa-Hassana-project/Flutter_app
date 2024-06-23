class QuranModelEN {
  final int number;
  final String name;
  final String ayahs;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<QuranItem> array; // Correct type here

  QuranModelEN({
    required this.number,
    required this.name,
    required this.ayahs,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.array, // Correct type here

  });

  factory QuranModelEN.fromJson(Map<String, dynamic> json) {
    final ayahs = json['ayahs'] as List<dynamic>;

    return QuranModelEN(
      number: json['number'],
      name: json['name'],
      ayahs: ayahs.map((ayah) => ayah['text']).join('\n'), // Join ayahs
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      array: ayahs.map((ayah) => QuranItem(ayahs: ayah['text'])).toList(),
      revelationType: json['revelationType'],
    );
  }
}
class QuranItem {
  final String ayahs;

  QuranItem({required this.ayahs});

  factory QuranItem.fromJson(Map<String, dynamic> json) {
    return QuranItem(
      ayahs: json['data']['surahs']['ayahs']['text'],
    );
  }
}