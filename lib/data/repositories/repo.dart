import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_flutter_task/data/data_sources/api.dart';
import 'package:route_flutter_task/data/models/product.dart';
import 'package:route_flutter_task/utils/failure.dart';

class Repo {
  final Api _api;

  Repo(this._api);

  Future<Either<String, List<Product>>> getProducts() async {
    try {
      List<Product> products = [];
      var response = await _api.getProducts();
      for (var product in response as List) {
        products.add(Product.fromJson(product));
      }
      return right(products);
    } on DioException catch (dioError) {
      Failure failure = Failure.fromDioError(dioError);
      return left(failure.message);
    } catch (error) {
      return left(error.toString());
    }
  }
}
