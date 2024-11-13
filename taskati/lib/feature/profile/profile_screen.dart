import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? path;
  String name = '';
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                isDarkMode = AppLocalStorage.getCachedData(
                        AppLocalStorage.isDarkModeKey) ??
                    false;
                AppLocalStorage.cacheData(
                    AppLocalStorage.isDarkModeKey, !isDarkMode);
              },
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showImageBottomSheet(context);
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: FileImage(File(
                          AppLocalStorage.getCachedData(
                              AppLocalStorage.imageKey))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: AppColors.primaryColor,
                          )),
                    )
                  ],
                ),
              ),
              const Gap(40),
              const Divider(
                thickness: 1,
                color: AppColors.primaryColor,
              ),
              const Gap(30),
              Row(
                children: [
                  Text(
                    AppLocalStorage.getCachedData('name'),
                    style: getTitleTextStyle(context,
                        color: AppColors.primaryColor, fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton.outlined(
                      constraints:
                          const BoxConstraints(maxHeight: 35, maxWidth: 35),
                      style: IconButton.styleFrom(
                          side:
                              const BorderSide(color: AppColors.primaryColor)),
                      onPressed: () {
                        showNameBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.primaryColor,
                        size: 20,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showImageBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 3,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const Gap(20),
                CustomButton(
                    width: double.infinity,
                    text: 'Upload From Camera',
                    onPressed: () {
                      uploadImage(true);
                    }),
                const Gap(15),
                CustomButton(
                    width: double.infinity,
                    text: 'Upload From Gallery',
                    onPressed: () {
                      uploadImage(false);
                    }),
              ],
            ),
          );
        });
  }

  showNameBottomSheet(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var textController = TextEditingController(
      text: AppLocalStorage.getCachedData('name'),
    );
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const Gap(11),
                    TextFormField(
                      style: getBodyTextStyle(
                        context,
                      ),
                      controller: textController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const Gap(10),
                    CustomButton(
                        text: 'Update Name',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AppLocalStorage.cacheData(
                                'name', textController.text);
                            setState(() {});
                            Navigator.pop(context);
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  uploadImage(bool isCamera) async {
    await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(AppLocalStorage.imageKey, value.path);
        setState(() {});
        Navigator.of(context).pop();
      }
    });
  }
}
