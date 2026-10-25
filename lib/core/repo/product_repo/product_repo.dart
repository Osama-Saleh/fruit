import 'package:dartz/dartz.dart';
import 'package:taswek/core/model/product_model.dart';

abstract class ProductRepo {
  Future<Either<String, List<ProductModel>>> getAllProducts();
  Future<Either<String, List<ProductModel>>> getBestSellingProducts();
  

}