import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/theme.dart';
import 'package:taskati/feature/intro/splash_screen.dart';

// 1) add hive and hive_flutter packages
// 2) initialize hive
// 3) open a box with the name of your choice "user".
// 4) generate type adapter for task model
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('user');
  await Hive.openBox<TaskModel>('task');
  await AppLocalStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppLocalStorage.userBox.listenable(),
        builder: (context, value, child) {
          bool isDarkMode =
              AppLocalStorage.getCachedData(AppLocalStorage.isDarkModeKey) ??
                  false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: const SplashScreen(),
          );
        });
  }
}
