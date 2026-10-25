import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/core/repo/product_repo/product_repo.dart';
import 'package:taswek/features/home/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit({required this.productRepo}) : super(ProductInitial());
  Future<void> getAllProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getAllProducts();
    result.fold(
      (failure) => emit(ProductFailure(error: failure)), 
      (products) => emit(ProductSuccess(products: products)));
  }
}