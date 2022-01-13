import 'package:app/components/buttons/solid_button.dart';
import 'package:app/components/buttons/striped_button.dart';
import 'package:app/components/form/input_field.dart';
import 'package:app/components/form/input_field_password.dart';
import 'package:app/screen/home/home_screen.dart';
import 'package:app/screen/signup/signup_screen.dart';
import 'package:app/services/UserService.dart';
import 'package:app/utilities/ResponseObject.dart';
import 'package:app/utilities/Utils.dart';
import 'package:app/utilities/const.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  static String routeName = '/login';
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height - 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: size.width * .6,
                              child:
                                  Image.asset('assets/images/login_screen.png'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .1),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 7),
                              InputField(
                                prefixIcon: Icon(Icons.email),
                                onChange: (value) {
                                  email = value;
                                },
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter your email or phone";
                                  }
                                  return null;
                                },
                                hintText: "Enter Phone Number",
                                labelText: "Phone Number",
                              ),
                              SizedBox(height: 12),
                              InputFieldPassword(
                                  prefixIcon: "assets/icons/lock.svg",
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  onChange: (value) {
                                    password = value;
                                  },
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  }),
                              SizedBox(height: 15),
                              SizedBox(height: 30),
                              SolidButton(
                                title: "Log In",
                                onPress: () async {
                                  if (_formKey.currentState!.validate()) {
                                    Utils().unFocusKeyBoard();
                                    ResponseObject response =
                                        await UserService()
                                            .makeLoginRequest(email, password);
                                    if (Utils().validateResponse(
                                        context, response.object)) {
                                      if (response.object['success']) {
                                        Utils().showMessage(context,
                                            "Login Success", Colors.green);
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            HomeScreen.routeName,
                                            (r) => false);
                                      } else {
                                        Utils().showMessage(context,
                                            "Login failed", Colors.redAccent);
                                      }
                                    } else {
                                      Utils().showMessage(context,
                                          "Login failed", Colors.redAccent);
                                    }
                                  }
                                },
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have and account?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF1E2F48),
                            ),
                          ),
                          SizedBox(width: 3),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            },
                            child: Text(
                              "register",
                              style: TextStyle(
                                fontSize: 16,
                                color: kPrimaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
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
