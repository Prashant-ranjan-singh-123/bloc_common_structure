import 'package:dio/dio.dart';
import 'dio_client.dart';

class MyAppEndpoints {
  MyAppEndpoints._();
  static MyAppEndpoints instance() => MyAppEndpoints._();

  Future<Response> login({required FormData data}) async {
    try {
      return await MyAppDio.instance().post('/rohit.php');
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
