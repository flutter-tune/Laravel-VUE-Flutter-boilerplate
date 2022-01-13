import 'package:app/components/buttons/solid_button.dart';
import 'package:app/components/form/input_field.dart';
import 'package:app/screen/signin/signin_screen.dart';
import 'package:app/services/UserService.dart';
import 'package:app/utilities/ResponseObject.dart';
import 'package:app/utilities/Utils.dart';
import 'package:app/utilities/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/signup_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  bool rememberMe = false;
  String name = "";
  String email = "";
  String password = "";

  String contactNo = "";

  String confirmPassword = "";
  final _formKey = GlobalKey<FormState>();
  _submitRegister() async {
    if (_formKey.currentState!.validate() && !loading) {
      setState(() {
        loading = true;
      });
      Utils().unFocusKeyBoard();
      ResponseObject response =
          await UserService().makeRegisterRequest(name, email, contactNo);
      if (Utils().validateResponse(context, response.object)) {}
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height - 70,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * .6,
                          child: Image.asset(
                              'assets/images/registration_screen.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputField(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Enter Phone Number',
                                labelText: 'Phone Number',
                                onChange: (value) {
                                  contactNo = value;
                                },
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Phone Number';
                                  } else if (!emailValidatorRegExp
                                      .hasMatch(value)) {
                                    return "Enter Valid Phone Number";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              InputField(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Enter Phone Number',
                                labelText: 'Phone Number',
                                onChange: (value) {
                                  contactNo = value;
                                },
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Phone Number';
                                  } else if (!emailValidatorRegExp
                                      .hasMatch(value)) {
                                    return "Enter Valid Phone Number";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              InputField(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Enter Phone Number',
                                labelText: 'Phone Number',
                                onChange: (value) {
                                  contactNo = value;
                                },
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Phone Number';
                                  } else if (!emailValidatorRegExp
                                      .hasMatch(value)) {
                                    return "Enter Valid Phone Number";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              InputField(
                                prefixIcon: Icon(Icons.email),
                                hintText: 'Enter Phone Number',
                                labelText: 'Phone Number',
                                onChange: (value) {
                                  contactNo = value;
                                },
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Phone Number';
                                  } else if (!emailValidatorRegExp
                                      .hasMatch(value)) {
                                    return "Enter Valid Phone Number";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              SolidButton(
                                title: "Send OTP",
                                // onPress: _submitRegister,
                                onPress: _submitRegister,
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 3),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SigninScreen.routeName);
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 16,
                                color: kPrimaryColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
