import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/shared/components/text_form_field.dart';
import 'package:project/shared/styles/standers.dart';

class sign_up extends StatefulWidget {

  sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  var firstnameController =TextEditingController();
  var midController =TextEditingController();
  var lastController =TextEditingController();
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var conf_passControler =TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var s = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      backgroundColor: maincolor,
      body:
      SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/logo/oswah.png"),width:110,height: 110,),
                Text("SIGN UP",style: TextStyle(fontSize: 48,color: Colors.white),),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: .4*w,
                        child: TextFormWidget(keyboardType: TextInputType.name,label:"First Name",Controller: firstnameController,
                          validator: (value){
                            if (value == null || value == '') {
                              return 'Please Enter first name';
                            }
                            return null;
                          },
                          width_line:100 ,
                          preIcon: Icons.person,
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 0.40*w,
                        child: TextFormWidget(keyboardType: TextInputType.name,label:"Mid Name",Controller: midController,
                          validator: (value){
                            if (value == null || value == '') {
                              return 'Please Enter Middle Name';
                            }
                            return null;
                          },
                          width_line: 100,
                          preIcon: Icons.person,
                        ),
                      )
                    ],
                  ),
                ),
                TextFormWidget(keyboardType: TextInputType.name,label:"Last Name",Controller: lastController,
                  validator: (value){
                    if (value == null || value == '') {
                      return 'Please Enter Last Name';
                    }
                    return null;
                  },
                  preIcon: Icons.person,
                ),
                TextFormWidget(keyboardType: TextInputType.emailAddress,label:"Email",Controller: emailController,
                  validator: (value){
                  if (value!.isEmpty ) {
                      return 'Please enter an email address';
                    }
                    // Use a regular expression to validate the email format
                    final emailRegExp =
                    RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                    if (!emailRegExp.hasMatch(value)) {
                      return 'Not a valid email address. Should be your@email.com';
                    }
                    return null;
                  },
                  preIcon: Icons.email,
                ),
                TextFormWidget(keyboardType: TextInputType.visiblePassword,label:"Password",
                  Controller: passwordController,
                  ispassword: true,
                  sufIcon: CupertinoIcons.eye,
                  validator: (value){
                    if (value == null || value == '') {
                      return 'Password is required';
                    }
                    return null;
                  },
                  preIcon: Icons.lock,
                ),
                TextFormWidget(keyboardType: TextInputType.visiblePassword,label:"Confirm Password",Controller: conf_passControler,
                  validator: (value){
                    if (value == null || value == '') {
                      return 'must confirm password is required';
                    }else if( passwordController != conf_passControler){
                      return 'Password Not similar';
                    }
                    return null;
                  },
                  ispassword: true,
                  sufIcon: CupertinoIcons.eye,
                  preIcon: Icons.lock,
                ),
                ElevatedButton(onPressed: (){
                  print('the height is $h');
                  print('the width is $w');
                },style:
                ElevatedButton.styleFrom(backgroundColor: Color(0xff004038),
                  fixedSize: Size(double.maxFinite, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17))
                ),
                    child: Text("SIGN UP",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 26,),
                Row(
                  children: [
                    Text("Already have an Account?",style: TextStyle(color: Color(0xff004038),fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    InkWell(
                        onTap: (){

                        },
                        child: Text("Sign up",style: TextStyle(color: Colors.white),)),
                  ],
                )

              ],
            ),
          ),
        ),
      )
    );
  }
}
