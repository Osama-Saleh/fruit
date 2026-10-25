import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/core/repo/product_repo/product_repo.dart';
import 'package:taswek/core/utils/get_it.dart';
import 'package:taswek/features/home/presentation/cubit/product_cubit.dart';
import 'package:taswek/features/home/presentation/cubit/product_state.dart';
import 'package:taswek/features/home/presentation/widgets/fruit_item.dart';

class GridFruitItem extends StatelessWidget {
  const GridFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(productRepo: getIt<ProductRepo>())..getAllProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            return SliverGrid.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return FruitItem(productModel: state.products[index]);
              },
            );
          } else if (state is ProductFailure) {
            return SliverToBoxAdapter(child: Center(child: Text(state.error)));
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
