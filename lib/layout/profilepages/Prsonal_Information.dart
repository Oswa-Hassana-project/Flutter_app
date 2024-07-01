import 'package:flutter/material.dart';

import '../../shared/components/text_form_field.dart';
import '../../shared/styles/response.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final _name = TextEditingController();
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: heightR(137, context),
            left: widthR(24, context),
            right: widthR(24, context),
          ),
          child: Column(
            children: [
              TextFormWidget(
                Controller: _name,
                label: 'Full Name',
                keyboardType: TextInputType.name,
              ),
              TextFormWidget(
                Controller: _name,
                label: 'Full Name',
                keyboardType: TextInputType.name,
              ),
              TextFormWidget(
                Controller: _name,
                label: 'Full Name',
                keyboardType: TextInputType.name,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormWidget(
                      width_line: widthR(50, context),
                      Controller: _name,
                      label: 'Full Name',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    width: widthR(10, context),
                  ),
                  Expanded(
                    child: TextFormWidget(
                      width_line: widthR(50, context),
                      Controller: _name,
                      label: 'Full Name',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              TextFormWidget(
                Controller: _name,
                label: 'Full Name',
                keyboardType: TextInputType.name,
              ),
            ],
          ),
        ),
        Container(
          height: heightR(120, context),
          width: widthR(393, context),
          decoration: BoxDecoration(
              color: Color(0xFF16A896),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              )),
          child: Padding(
            padding: EdgeInsets.only(
                top: heightR(49.2, context),
                left: widthR(20, context),
                right: widthR(20, context)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sizeR(24, context),
                    fontWeight: FontWeight.w700),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
