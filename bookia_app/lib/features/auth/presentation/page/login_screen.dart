import 'package:bookia_app/core/constants/app_assets.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:bookia_app/features/auth/presentation/widgets/social_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: getFont30TextStyle(),
            ),
            const Gap(32),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            const Gap(15),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIconConstraints:
                      const BoxConstraints(maxHeight: 17, maxWidth: 53),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SvgPicture.asset(AppAssets.eye),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: getFont14TextStyle(color: AppColors.darkGreyColor),
                    )),
              ],
            ),
            const Gap(20),
            CustomButton(text: 'Login', onPressed: () {}),
            const Gap(30),
            const OrDivider(),
            const Gap(25),
            const SocialLoginButtons(),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: getFont16TextStyle(color: AppColors.darkGreyColor),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: getFont16TextStyle(color: AppColors.primaryColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
