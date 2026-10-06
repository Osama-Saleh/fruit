import 'package:flutter/material.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/helper/on_generate_routs.dart';
import 'package:taswek/core/services/local_storage.dart';
import 'package:taswek/core/utils/app_colors.dart';
import 'package:taswek/core/utils/app_constant.dart';
import 'package:taswek/core/widgets/custom_botton.dart';
import 'package:taswek/features/on_boarding/presentation/widgets/page_view_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();

    pageController?.addListener(() {
      int page = pageController?.page?.round() ?? 0;

      setState(() {
        currentPage = page;
      });
    });
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                child: PageView(
                  controller: pageController,
                  children: [
                    PageViewItem(
                      
                      imageBackground:
                          AppImages.imagesOnboardingOnBoardingBGImage1,
                      imageFrueit: AppImages.imagesOnboardingOnBoardingFruit1,
                      title: 'مرحبًا بك في FruitHUB',
                      subtitle:
                          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
                      showSkip: currentPage == 0,
                    ),
                    PageViewItem(
                      imageBackground:
                          AppImages.imagesOnboardingOnBoardingBGImage2,
                      imageFrueit: AppImages.imagesOnboardingOnBoardingFruit2,
                      title: 'ابحث وتسوق',
                      subtitle:
                          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: List.generate(2, (index) {
                  return CircleAvatar(
                    radius: 6,
                    backgroundColor: currentPage >= index
                        ? AppColors.primaryColor
                        : AppColors.primaryColor.withValues(alpha: .5),
                  );
                }),
              ),
              Visibility(
                visible: currentPage == 1,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,

                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: CustomButton(
                    onPressed: () async{
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.loginViewRouteName,
                        (route) => false,
                      );
                     await SecureStorage.instance.write(key: AppConstant.onBoardingKey, value: 'true');
                    },
                    text: 'أبدأ الأن',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
