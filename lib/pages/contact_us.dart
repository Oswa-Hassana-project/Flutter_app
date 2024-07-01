import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: heightR(40, context),
          ),
          Image(
            image: AssetImage("assets/logo/logo11.png"),
            width: widthR(150, context),
            height: heightR(150, context),
          ),
          ContactInformation(
              click: () => _launchURL("uswahhasanah1724@outlook.com"),
              icon: Bootstrap.microsoft,
              Title: "Outlook Email",
              SubTitle: 'uswahhasanah1724@outlook.com'),
          ContactInformation(
              click: () => showModalActionSheet(
                  context: context,
                  title: "Uswah Hasanah",
                  message:
                      "The proposed system integrates search (including NLP) to guide and engage Muslims, providing a following sunnah and providing trusted Islamic content. We will design this via a mobile app based on the Flutter platform, this mobile app uses a web backend that handles all processes including (AI techniques like NLP)."),
              icon: Iconsax.information_outline,
              Title: "what is Uswah Hasanah",
              SubTitle: '')
        ],
      ),
    );
  }

  Widget ContactInformation({
    VoidCallback? click,
    required IconData icon,
    required String Title,
    required String SubTitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(Title),
        subtitle: Text(SubTitle),
        tileColor: Colors.white,
        onTap: click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Future<void> _launchURL(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $email');
    }
  }
}
