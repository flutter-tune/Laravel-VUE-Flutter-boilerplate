import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

localLogin(user, token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('loggedin', true);
  prefs.setString('user', jsonEncode(user));
  prefs.setString('profile', jsonEncode(user["profile"]));
  prefs.setString('token', token);
}

localLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('loggedin', false);
  prefs.setString('user', "");
  prefs.setString('token', "");
}

localGetUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('user') == "") {
    return "";
  }
  return jsonDecode(prefs.getString('user').toString());
}

localSetUser(user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user', jsonEncode(user));
}

localGetProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return jsonDecode(prefs.getString('profile').toString());
}

localSetProfileFromData(user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('profile', jsonEncode(user));
  return 1;
}

setUpdateInfo(forceUpdate, forceMessage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('forceUpdate', forceUpdate);
  prefs.setString('forceMessage', forceMessage);
}

getUpdateInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return {
    "forceUpdate": prefs.getBool('forceUpdate') != null
        ? prefs.getBool('forceUpdate')
        : false,
    "forceMessage": prefs.getString('forceMessage') != null
        ? prefs.getString('forceMessage')
        : ""
  };
}

localGetToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

localIsLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('loggedin') == null) {
    return false;
  }
  return prefs.getBool('loggedin');
}
