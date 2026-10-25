import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taswek/core/utils/app_colors.dart';
import 'package:taswek/core/utils/app_text_style.dart';
import 'package:taswek/features/home/domain/entites/bottom_navi_bar_entity.dart';
import 'package:taswek/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeViewBody()),
      bottomNavigationBar: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 70,
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 25,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: BottomNaviBarEntity.bottomNaviBarList.asMap().entries.map((
            e,
          ) {
            int currentIndex = e.key;
            return Expanded(
              flex: _selectedIndex == currentIndex ? 3 : 2,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = currentIndex;
                  });
                },
                child: CustomNavigation(
                  isActive: _selectedIndex == currentIndex,
                  bottomNaviBarEntity: e.value,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({
    super.key,
    required this.isActive,
    required this.bottomNaviBarEntity,
  });
  final bool isActive;
  final BottomNaviBarEntity bottomNaviBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveIcon(bottomNaviBarEntity: bottomNaviBarEntity)
        : InActiveIcon(bottomNaviBarEntity: bottomNaviBarEntity);
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.bottomNaviBarEntity});
  final BottomNaviBarEntity bottomNaviBarEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.grayLight,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.primaryColor,
              child: SvgPicture.asset(bottomNaviBarEntity.activeIcon),
            ),
            const SizedBox(width: 4),
            Text(
              bottomNaviBarEntity.title,
              style: AppTextStyles.semiBold11.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({super.key, required this.bottomNaviBarEntity});
  final BottomNaviBarEntity bottomNaviBarEntity;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      bottomNaviBarEntity.inactiveIcon,
      fit: BoxFit.scaleDown,
    );
  }
}
