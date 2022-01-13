import 'package:app/utilities/const.dart';

class ResponseObject {
  int id;
  dynamic object;
  int statusCode;
  ResponseObject(
      {this.id: ResponseCode.NO_INTERNET_CONNECTION,
      required this.object,
      this.statusCode = 200});
}
