import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box<TaskModel> taskBox;
  static String nameKey = 'name';
  static String imageKey = 'image';
  static String isUploadKey = 'isUpload';
  static String isDarkModeKey = 'isDarkMode';

  static init() {
    userBox = Hive.box('user');
    taskBox = Hive.box<TaskModel>('task');
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getCachedData(String key) {
    return userBox.get(key);
  }

  static cacheTaskData(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getCachedTaskData(String key) {
    return taskBox.get(key);
  }
}
