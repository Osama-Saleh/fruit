import 'package:flutter/material.dart';
import 'package:taswek/features/home/presentation/widgets/custom_app_bar_home_body.dart';
import 'package:taswek/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:taswek/features/home/presentation/widgets/featured_item.dart';
import 'package:taswek/features/home/presentation/widgets/fruit_item_header.dart';
import 'package:taswek/features/home/presentation/widgets/grid_fruit_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomAppBarHomeBody()),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: CustomSearchTextField(
              controller: TextEditingController(),
              hintText: 'ابحث ...',
            ),
          ),

          SliverToBoxAdapter(child: FeaturedItem()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: FruitItemHeader()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          GridFruitItem(),
        ],
      ),
    );
  }
}
