class QuranModel {
  final int number;
  final String name;
  final String ayahs;


  QuranModel({
    required this.number,
    required this.name,
    required this.ayahs,

  });

  // factory QuranModel.fromJson(json) {
  //   return QuranModel(
  //     number: json['data']['surahs']['number'],
  //     name: json['data']['surahs']['name'],
  //     ayahs: json['data']['surahs']['ayahs']['text'],
  //   );
  // }
}
