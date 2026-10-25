import 'package:taswek/core/model/product_model.dart';

class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  ProductSuccess({required this.products});
}
class ProductFailure extends ProductState {
  final String error;
  ProductFailure({required this.error});
}