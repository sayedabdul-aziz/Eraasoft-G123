import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/add_task_screen.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
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
              DateFormat.yMMMMd().format(DateTime.now()),
              style: getTitleTextStyle(context, fontSize: 16),
            ),
            Text(
              'Today',
              style: getTitleTextStyle(context, fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        CustomButton(
            width: 135,
            text: '+Add Task',
            onPressed: () {
              pushTo(context, const AddTaskScreen());
            })
      ],
    );
  }
}
