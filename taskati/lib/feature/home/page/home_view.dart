import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/task_item.dart';
import 'package:taskati/feature/home/widgets/today_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(15),
              const TodayHeader(),
              const Gap(15),
              DatePicker(
                width: 80,
                height: 100,
                DateTime.now().subtract(const Duration(days: 2)),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                dayTextStyle: getBodyTextStyle(context),
                dateTextStyle: getBodyTextStyle(context),
                monthTextStyle: getBodyTextStyle(context),
                onDateChange: (date) {
                  setState(() {
                    selectedDate = DateFormat('dd/MM/yyyy').format(date);
                  });
                },
              ),
              const Gap(15),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: AppLocalStorage.taskBox.listenable(),
                  builder: (context, box, child) {
                    List<TaskModel> tasks = [];

                    for (var element in box.values) {
                      if (element.date == selectedDate) {
                        tasks.add(element);
                      }
                    }

                    if (tasks.isEmpty) {
                      return Column(children: [
                        Lottie.asset('assets/images/empty.json'),
                        Text(
                          'No tasks for $selectedDate',
                          style: getBodyTextStyle(context, fontSize: 16),
                        )
                      ]);
                    }
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          secondaryBackground: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(Icons.delete,
                                    color: AppColors.whiteColor),
                                const Gap(10),
                                Text('Delete',
                                    style: getBodyTextStyle(context,
                                        color: AppColors.whiteColor)),
                              ],
                            ),
                          ),
                          background: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.check,
                                    color: AppColors.whiteColor),
                                const Gap(10),
                                Text('Complete',
                                    style: getBodyTextStyle(context,
                                        color: AppColors.whiteColor)),
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              box.put(
                                  tasks[index].id,
                                  TaskModel(
                                    title: tasks[index].title,
                                    note: tasks[index].note,
                                    date: tasks[index].date,
                                    startTime: tasks[index].startTime,
                                    endTime: tasks[index].endTime,
                                    color: 3,
                                    id: tasks[index].id,
                                    isCompleted: true,
                                  ));
                            } else {
                              box.delete(tasks[index].id);
                            }
                          },
                          child: GestureDetector(
                            onTap: () {},
                            child: TaskItem(
                              taskModel: tasks[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
