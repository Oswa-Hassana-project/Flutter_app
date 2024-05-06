import 'dart:convert';

import 'package:project/models/quran_model.dart';
import 'package:http/http.dart' as http;

class quranRepository {
  Future<List<QuranModel>> getAll() async {
    const url = "https://api.alquran.cloud/v1/quran/quran-uthmani";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as Map<String, dynamic>;
      final surahs = data['surahs'] as List<dynamic>; // Surahs is a list

      // Assuming you want to process all surahs, you might need a loop here
      final results = surahs.map((surah) {
        final surahData = surah as Map<String, dynamic>;
        final ayahs = surahData['ayahs'] as List<dynamic>; // Ayahs is a list
        final ayahText = ayahs
            .map((ayah) => ayah['text'])
            .join('\n'); // Join ayah texts if needed


        return QuranModel(
          number: surahData['number'],
          name: surahData['name'] as String,
          ayahs: ayahText as String,
          englishName: surahData['englishName'],
          englishNameTranslation : surahData['englishNameTranslation'],
          array: ayahs.map((ayah) => QuranItem(ayahs: ayah['text'])).toList(),
          revelationType: surahData['revelationType'],
        );
      }).toList();

      return results;
    } else {
      throw Exception("the quran repository has error ${response.statusCode}");
      // throw Exception(response.reasonPhrase);
    }
  }
}
