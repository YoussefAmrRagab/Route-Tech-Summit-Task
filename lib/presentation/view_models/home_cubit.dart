import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:route_flutter_task/data/models/product.dart';
import 'package:route_flutter_task/data/repositories/repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repo _repo;

  HomeCubit(this._repo) : super(HomeInitial());

  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  void getProducts() async {
    Either<String, List<Product>> res = await _repo.getProducts();
    res.fold(
      (error) {
        emit(Error(error));
      },
      (data) {
        _products = data;
        emit(ProductLoaded(data));
      },
    );
  }

  void filterProducts(String text) async {
    if (text == '' || text.isEmpty) {
      emit(ProductLoaded(_products));
    } else {
      _filteredProducts = _products
          .where((element) => element.title
              .toLowerCase()
              .trim()
              .startsWith(text.toLowerCase().trim()))
          .toList();
      emit(ProductsFiltered(_filteredProducts));
    }
  }
}
