import 'package:flutter/material.dart';

const rootUrl = "http://192.168.0.102:8000";
const baseUrl = "http://192.168.0.102:8000/api";

const loginUrl = "$baseUrl/login";
const designationUrl = "$baseUrl/designations";
const resetPasswordUrl = "$baseUrl/password/reset";
const registerUrl = "$baseUrl/register";

const updatePasswordUrl = "$baseUrl/update-password";

bool isDebug = true;
final RegExp emailValidatorRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//final RegExp emailValidatorRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
final RegExp phoneValidatorRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
final RegExp nameRegExp = RegExp('[a-zA-Z]');

class ResponseCode {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int AUTHORIZATION_FAILED = 900;
  static const int SUCCESSFUL = 200;
  static const int SERVER_ERROR = 500;
  static const int FAILED = 501;
  static const int NOT_FOUND = 502;
}

final kFontMedium = FontWeight.w500;
final kFontBold = FontWeight.w700;
final kPrimaryColor = Color(0XFFFF7417);
final kPrimaryTextColor = Color(0XFF4E4E4E);
