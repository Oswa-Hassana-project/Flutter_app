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
      final surahs = data['surahs'] as Map<String, dynamic>;
      final ayahs = data['surahs']['ayahs'] as Map<String, dynamic>;

      final result = QuranModel(
        number: surahs['number'],
        name: surahs['name'] as String,
        ayahs: ayahs['text'] as String,
      );

      return [result];
    } else {
      throw Exception("the quran repository has error ${response.statusCode}");
      // throw Exception(response.reasonPhrase);
    }
  }
}
