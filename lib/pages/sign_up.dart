import 'package:finalproject/shared/cubit/cubit.dart';
import 'package:finalproject/shared/cubit/states.dart';
import 'package:finalproject/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

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
  final GlobalKey<FlutterPwValidatorState> validatorKey = GlobalKey<FlutterPwValidatorState>();


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder:(context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              body:
              SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 29),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/logo/اسوه حسنه1.png"),width:110,height: 110,),
                          Text("SIGN UP",style: TextStyle(fontSize: 48,color: Colors.white),),
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 154.5,
                                child: TextFormWidget(keyboardType: TextInputType.name,label:"First Name",Controller: firstnameController,
                                  validator: (value){
                                    if (value == null || value == '') {
                                      return 'Please Enter first name';
                                    }
                                    return null;
                                  },
                                  preIcon: Icons.person,
                                ),
                              ),
                              SizedBox(width: 17,),
                              SizedBox(
                                height: 50,
                                width: 154.5,
                                child: TextFormWidget(keyboardType: TextInputType.name,label:"Mid Name",Controller: midController,
                                  validator: (value){
                                    if (value == null || value == '') {
                                      return 'Please Enter Middle Name';
                                    }
                                    return null;
                                  },
                                  preIcon: Icons.person,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 14,),
                          TextFormWidget(keyboardType: TextInputType.name,label:"Last Name",Controller: lastController,
                            validator: (value){
                              if (value == null || value == '') {
                                return 'Please Enter Last Name';
                              }
                              return null;
                            },
                            preIcon: Icons.person,
                          ),
                          SizedBox(height: 14,),
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
                          SizedBox(height: 14,),
                          TextFormWidget(keyboardType: TextInputType.visiblePassword,label:"Password",
                            Controller: passwordController,
                            ispassword: cubit.isPassword,
                            sufIcon: cubit.isPassword?CupertinoIcons.eye_slash:CupertinoIcons.eye,
                            suffixPressed: () {
                            cubit.PasswordIsShow();
                            },
                            validator: (value){
                              if (value == null || value == '') {
                                return 'Password is required';
                              }else if( passwordController.text != conf_passControler.text){
                                passconfirm(false);
                              }
                              return null;
                            },
                            preIcon: Icons.lock,
                          ),
                          FlutterPwValidator(width: 400,
                            height: 150,
                            minLength: 8,
                            numericCharCount: 2,
                            uppercaseCharCount: 1,
                            specialCharCount: 1,

                            onSuccess:(){
                            },
                            controller: passwordController,

                          ),
                          SizedBox(height: 14,),
                          TextFormWidget(keyboardType: TextInputType.visiblePassword,label:"Confirm Password",Controller: conf_passControler,
                            validator: (value){
                              if (value == null || value == '') {
                                return 'must confirm password is required';
                              }else if( passwordController.text != conf_passControler.text){
                                return passconfirm(false);
                              }
                              return null;
                            },
                            ispassword: cubit.isPassword,
                            sufIcon: cubit.isPassword?CupertinoIcons.eye_slash:CupertinoIcons.eye,
                            suffixPressed: () {
                              cubit.PasswordIsShow();
                            },
                            preIcon: Icons.lock,
                          ),
                          SizedBox(height: 14,),
                          ElevatedButton(onPressed: (){
                            if(formKey.currentState!.validate()){
                              print(passwordController.text);
                            }
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
                                  onTap: (){},
                                  child: Text("Sign in",style: TextStyle(color: Colors.white),)),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              )
          );

        },
      ),
    );
  }
  String? passconfirm(value){
    if (value==true){
      return null;
    }else {
      return "Password Not similar";
    }
  }
}
