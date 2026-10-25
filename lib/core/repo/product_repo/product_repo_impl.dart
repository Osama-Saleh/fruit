import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:taswek/core/model/product_model.dart';
import 'package:taswek/core/repo/product_repo/product_repo.dart';
import 'package:taswek/core/services/data_base.dart';

class ProductRepoImpl implements ProductRepo {
 final FirebaseFirestore db = FirebaseFirestore.instance;
  final  DataBaseService dataBaseService;
  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<String, List<ProductModel>>> getAllProducts() async{
    try {
     List<Map<String, dynamic>> date = await dataBaseService.getAllData(pathName: "products");
     
     return right(date.map((e) => ProductModel.fromJson(e)).toList());
      
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getBestSellingProducts() {
    throw UnimplementedError();
  }

  
}
