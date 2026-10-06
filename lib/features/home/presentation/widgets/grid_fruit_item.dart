import 'package:flutter/material.dart';
import 'package:taswek/features/home/presentation/widgets/fruit_item.dart';

class GridFruitItem extends StatelessWidget {
  const GridFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}
