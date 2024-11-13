import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/profile/profile_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${AppLocalStorage.getCachedData(AppLocalStorage.nameKey)}',
              style: getTitleTextStyle(context,
                  color: AppColors.primaryColor, fontSize: 16),
            ),
            Text(
              'Have a Nice Day!',
              style: getBodyTextStyle(
                context,
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            pushTo(context, const ProfileScreen());
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: FileImage(
              File(AppLocalStorage.getCachedData(AppLocalStorage.imageKey)),
            ),
          ),
        )
      ],
    );
  }
}
