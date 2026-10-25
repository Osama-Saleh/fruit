import 'package:taswek/core/app_images/App_images.dart';

class BottomNaviBarEntity {
  final String title;
  final String activeIcon;
  final String inactiveIcon;
  BottomNaviBarEntity({
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  static List<BottomNaviBarEntity> bottomNaviBarList = [
    BottomNaviBarEntity(
      title: 'الرئيسية',
      activeIcon: AppImages.imagesHomeActivehome,
      inactiveIcon: AppImages.imagesHomeHome,
    ),
    BottomNaviBarEntity(
      title: 'المنتجات',
      activeIcon: AppImages.imagesHomeActiveelement3,
      inactiveIcon: AppImages.imagesHomeElement3,
    ),
    BottomNaviBarEntity(
      title: 'سلة التسوق',
      activeIcon: AppImages.imagesHomeActiveshoppingCart,
      inactiveIcon: AppImages.imagesHomeShoppingCart,
    ),
    BottomNaviBarEntity(
      title: 'حسابي',
      activeIcon: AppImages.imagesHomeActiveuser,
      inactiveIcon: AppImages.imagesHomeUser,
    ),
  ];
}
