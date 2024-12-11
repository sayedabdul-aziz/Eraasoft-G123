import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:se7ety/core/services/local_storage/local_storage.dart';
import 'package:se7ety/core/utils/themes.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/intro/splash/splash_screen.dart';
import 'package:se7ety/firebase_options.dart';

// flavors

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppLocalStorage.init();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar')],
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
