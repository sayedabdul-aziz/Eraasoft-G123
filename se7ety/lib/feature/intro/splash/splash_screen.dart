import 'package:flutter/material.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/feature/intro/onboarding/page/onboarding_screen.dart';
import 'package:se7ety/feature/intro/welcome/welcome_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      bool isOnboardingShown =
          AppLocalStorage.getCachedData(key: AppLocalStorage.kOnboarding) ==
              true;

      if (isOnboardingShown) {
        pushReplacement(context, const WelcomeView());
      } else {
        pushReplacement(context, const OnboardingScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 220,
        ),
      ),
    );
  }
}
