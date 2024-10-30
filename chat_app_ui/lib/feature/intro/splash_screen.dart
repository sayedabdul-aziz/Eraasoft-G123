import 'package:chat_app_ui/feature/auth/page/login_screen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  'https://www.logoku.com/image/c/data/items/1702823541_logokucom_letter-p-chat-logo.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Chatia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              'Chat with anyone',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
