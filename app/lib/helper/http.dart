import 'dart:convert';
import 'dart:io';

import 'package:app/helper/auth.dart';
import 'package:http/http.dart';
import 'package:app/utilities/HttpResponse.dart';
import 'package:app/utilities/UploadFile.dart';
import 'package:app/utilities/Utils.dart';
import 'package:app/utilities/const.dart';

getHttp(uri) async {
  try {
    var response = await get(Uri.parse(uri));
    return HttpResponse(
        statusCode: response.statusCode, body: jsonDecode(response.body));
  } catch (e) {
    if (isDebug) {
      print(e);
      Utils().showToast(e.toString(), true);
    }
  }
}

getAuthHttp(uri) async {
  String token = await localGetToken();
  try {
    var response = await get(Uri.parse(uri), headers: {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    var body = jsonDecode(response.body);
    if (body.containsKey('message')) {
      if (body['message'] == 'Unauthenticated.' ||
          body['message'] == 'Unauthorised') {
        return 401;
      }
    }
    return HttpResponse(
        statusCode: response.statusCode, body: jsonDecode(response.body));
  } catch (e) {
    if (isDebug) {
      print(e);
      Utils().showToast(e.toString(), true);
    }
  }
}

postAuthHttp(uri, body) async {
  print(uri);
  String token = await localGetToken();

  try {
    var response = await post(Uri.parse(uri), body: jsonEncode(body), headers: {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    return HttpResponse(
        statusCode: response.statusCode, body: jsonDecode(response.body));
  } catch (e) {
    if (isDebug) {
      print(e);
      Utils().showToast(e.toString(), true);
    }
  }
}

postHttp(uri, body) async {
  try {
    var response = await post(Uri.parse(uri),
        body: body, headers: {"Accept": "application/json"});
    return HttpResponse(
        statusCode: response.statusCode, body: jsonDecode(response.body));
  } catch (e) {
    if (isDebug) {
      Utils().showToast("Unable to proceed", true);
      return HttpResponse(statusCode: 61, body: e);
    }
  }
}

postWithImages(url, body, List<UploadFile> files) async {
  String token = await localGetToken();

  var request = MultipartRequest('POST', Uri.parse(url));

  request.headers.addAll({
    'Authorization': 'Bearer $token',
    "Content-Type": "application/json",
    "Accept": "application/json"
  });
  print('Bearer $token');
  print(jsonEncode(body));

  request.fields.addAll(body);
  for (UploadFile file in files) {
    if (file.path != "") {
      request.files.add(MultipartFile(
          file.name,
          File(file.path).readAsBytes().asStream(),
          File(file.path).lengthSync(),
          filename: file.path.split("/").last));
    }
  }

  try {
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    return HttpResponse(
        statusCode: response.statusCode, body: jsonDecode(respStr));
  } catch (e) {
    if (isDebug) {
      print(e);
      Utils().showToast(e.toString(), true);
    }
  }
}
