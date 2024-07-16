import 'package:dio/dio.dart';
import 'package:route_flutter_task/config/app_strings.dart';

class Api {
  late Dio _dio;

  Api() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );

    _dio = Dio(options);
  }

  Future<dynamic> getProducts() async {
    Response response = await _dio.get(productsEndpoint);
    return response.data['products'];
  }
}
