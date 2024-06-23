import 'package:flutter/material.dart';
import 'package:project/models/quran_model.dart';
import 'package:project/shared/styles/standers.dart';

import '../../models/quran_model_english.dart';
import '../../shared/styles/response.dart';

class quranDetailsPage extends StatefulWidget {
  final QuranModel quran;
  final String surahname;
  final String surahtype;
  const quranDetailsPage({
    super.key,
    required this.quran,
    required this.surahtype,
    required this.surahname,
  });

  @override
  State<quranDetailsPage> createState() => _quranDetailsPageState();
}

class _quranDetailsPageState extends State<quranDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: heightR(179, context),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: maincolor,
                        borderRadius: BorderRadius.circular(30)),
                    width: widthR(343, context),
                    height: heightR(47, context),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            widget.surahname,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "verse 7 , ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.surahtype,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: ListView.builder(
                      itemCount: widget.quran.array.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      widget.quran.array[index].ayahs,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: heightR(100, context),
            width: widthR(393, context),
            decoration: BoxDecoration(
                color: Color(0xFF16A896),
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightR(49.2, context),
                  left: widthR(20, context),
                  right: widthR(20, context)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      "Qur'an",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeR(24, context),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
