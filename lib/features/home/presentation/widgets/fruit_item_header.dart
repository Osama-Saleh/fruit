import 'package:flutter/material.dart';
import 'package:taswek/core/utils/app_colors.dart';
import 'package:taswek/core/utils/app_text_style.dart';

class FruitItemHeader extends StatelessWidget {
  const FruitItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأكثر مبيعًا', style: AppTextStyles.bold16),
        Spacer(),
        Text(
          'المزيد',
          style: AppTextStyles.regular13.copyWith(color: AppColors.grayLight2),
        ),
      ],
    );
  }
}
