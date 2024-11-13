import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: taskModel.color == 3
            ? Colors.green
            : taskModel.color == 0
                ? AppColors.primaryColor
                : taskModel.color == 1
                    ? AppColors.orangeColor
                    : AppColors.redColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getTitleTextStyle(context,
                      fontSize: 16, color: AppColors.whiteColor),
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                    const Gap(5),
                    Text('${taskModel.startTime} : ${taskModel.endTime}',
                        style: getSmallTextStyle(
                            fontSize: 12, color: AppColors.whiteColor)),
                  ],
                ),
                const Gap(5),
                Text(
                  taskModel.note ?? '',
                  style: getBodyTextStyle(context, color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            width: 1,
            height: 60,
            color: AppColors.whiteColor,
          ),
          const Gap(8),
          RotatedBox(
            quarterTurns: 3,
            child: Text((taskModel.isCompleted ?? false) ? 'COMPLETED' : 'TODO',
                style: getSmallTextStyle(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
