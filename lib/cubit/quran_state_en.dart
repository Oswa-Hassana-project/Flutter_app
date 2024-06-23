import '../models/quran_model.dart';
import '../models/quran_model_english.dart';

abstract class quranStateEN{}

class InitQuranState extends quranStateEN{}
class LoadingQuranState extends quranStateEN{}
class ErrorQuranState extends quranStateEN{
  final  String message;
  ErrorQuranState(this.message);
}
class ResponseQuranState extends quranStateEN{
    final  List<QuranModelEN> qurans_en;
   ResponseQuranState(this.qurans_en);
}