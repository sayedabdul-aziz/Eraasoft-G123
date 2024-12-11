import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/feature/intro/onboarding/model/onboarding_model.dart';
import 'package:se7ety/feature/intro/welcome/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageController = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          if (pageIndex != onboardingPages.length - 1)
            TextButton(
                onPressed: () {
                  navigateToWelcome(context);
                },
                child: Text(
                  'تخطي',
                  style: getBodyStyle(color: AppColors.color1),
                ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                  itemCount: onboardingPages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const Spacer(flex: 2),
                        SvgPicture.asset(
                          onboardingPages[index].image,
                          height: 300,
                        ),
                        const Spacer(),
                        Text(onboardingPages[index].title,
                            style: getTitleStyle(
                              color: AppColors.color1,
                            )),
                        const Gap(20),
                        Text(
                          onboardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: getBodyStyle(),
                        ),
                        const Spacer(flex: 4),
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 45,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      spacing: 5,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.color1,
                    ),
                  ),
                  const Spacer(),
                  if (pageIndex == onboardingPages.length - 1)
                    CustomButton(
                        width: 100,
                        height: 45,
                        radius: 10,
                        text: 'هيا بنا',
                        onPressed: () {
                          navigateToWelcome(context);
                        })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToWelcome(BuildContext context) {
    AppLocalStorage.cacheData(key: AppLocalStorage.kOnboarding, value: true);
    pushReplacement(context, const WelcomeView());
  }
}
