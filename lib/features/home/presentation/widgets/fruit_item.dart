import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/model/product_model.dart';
import 'package:taswek/core/utils/app_colors.dart';
import 'package:taswek/core/utils/app_text_style.dart';

class FruitItem extends StatelessWidget {
  final ProductModel productModel;
  const FruitItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grayLight,

      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child:
                productModel.imageUrl != null &&
                    productModel.imageUrl!.isNotEmpty
                ? Image.network(
                    productModel.imageUrl!,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) =>
                        SvgPicture.asset(
                          AppImages.imagesOnboardingOnBoardingFruit2,
                          fit: BoxFit.scaleDown,
                          width: 200,
                        ),
                  )
                : SvgPicture.asset(
                    AppImages.imagesOnboardingOnBoardingFruit2,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              productModel.isOrganic ? Icons.favorite : Icons.favorite_border,
              color: productModel.isOrganic
                  ? AppColors.redLight
                  : AppColors.grayLight2,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productModel.name, style: AppTextStyles.semiBold13),
                      Text(
                        '${productModel.price} جنية / الكيلو',
                        style: AppTextStyles.regular13,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(radius: 20, child: Icon(Icons.add)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
