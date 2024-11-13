import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/functions/dialogs.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/page/home_view.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              if (path == null && name.isEmpty) {
                showErrorDialog(
                    context, 'Please upload your image and Enter your name');
              } else if (path == null && name.isNotEmpty) {
                showErrorDialog(context, 'Please upload your image');
              } else if (path != null && name.isEmpty) {
                showErrorDialog(context, 'Please Enter your name');
              } else {
                // cache the data
                AppLocalStorage.cacheData(AppLocalStorage.nameKey, name);
                AppLocalStorage.cacheData(AppLocalStorage.imageKey, path!);
                AppLocalStorage.cacheData(AppLocalStorage.isUploadKey, true);
                pushWithReplacement(context, const HomeView());
              }
            },
            child: Text(
              'Done',
              style: getBodyTextStyle(context, color: AppColors.whiteColor),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.primaryColor,
                backgroundImage: path != null
                    ? FileImage(File(path!))
                    : const AssetImage('assets/images/user.png'),
              ),
              const Gap(30),
              CustomButton(
                onPressed: () async {
                  await uploadImage(isCamera: true);
                },
                text: 'Upload From Camera',
              ),
              const Gap(10),
              CustomButton(
                onPressed: () async {
                  await uploadImage(isCamera: false);
                },
                text: 'Upload From Gallery',
              ),
              const Gap(20),
              const Divider(
                color: AppColors.primaryColor,
                indent: 20,
                endIndent: 20,
              ),
              const Gap(20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your name here',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadImage({required bool isCamera}) async {
    await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
