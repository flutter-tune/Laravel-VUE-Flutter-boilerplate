import 'dart:convert';

import 'package:app/helper/auth.dart';
import 'package:app/helper/http.dart';
import 'package:app/utilities/HttpResponse.dart';
import 'package:app/utilities/ResponseObject.dart';
import 'package:app/utilities/const.dart';

class UserService {
  Future makeLoginRequest(String email, String password) async {
    HttpResponse response =
        await postHttp("$loginUrl", {"email": email, "password": password});
    if (response.statusCode == 200) {
      localLogin(response.body["user"], response.body["token"]);
    }
    return ResponseObject(
        object: response.body, statusCode: response.statusCode);
  }

  Future makeResetPasswordRequest({required String email}) async {
    HttpResponse response =
        await postHttp("$resetPasswordUrl", {"email": email});

    return ResponseObject(
        object: response.body, statusCode: response.statusCode);
  }

  Future makeChangePasswordRequest(
      {required String oldPassword, required String password}) async {
    HttpResponse response = await postAuthHttp("$updatePasswordUrl",
        {"old_password": oldPassword, "password": password});

    return ResponseObject(
        object: response.body, statusCode: response.statusCode);
  }

  Future makeRegisterRequest(String name, String email, String password) async {
    HttpResponse response = await postHttp("$registerUrl", {
      "name": name,
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      localLogin(response.body["user"], response.body["token"]);
    }
    return ResponseObject(
        object: response.body, statusCode: response.statusCode);
  }
}
