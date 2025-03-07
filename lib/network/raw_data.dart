import 'package:dio/dio.dart';

class MyAppRawData {
  Map<String, dynamic> login({required String login, required String pass}) {
    Map<String, String> data;
    data = {'login': login, 'pass': pass};
    return data;
  }
}
