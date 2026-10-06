import 'package:flutter/material.dart';
import 'package:taswek/core/utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showArroBack;
  const CustomAppBar({
    super.key,
    required this.title,
    this.showArroBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyles.bold19),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: showArroBack ? const Icon(Icons.arrow_back_ios_new) : SizedBox(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
