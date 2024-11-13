import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/app_local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/page/home_view.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  var dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()));
  var startTimeController =
      TextEditingController(text: DateFormat('hh:mm a').format(DateTime.now()));
  String endTime = DateFormat('hh:mm a').format(DateTime.now());
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title',
                  style: getBodyTextStyle(
                    context,
                  )),
              const Gap(5),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const Gap(10),
              Text('Note',
                  style: getBodyTextStyle(
                    context,
                  )),
              const Gap(5),
              TextFormField(
                maxLines: 4,
                controller: noteController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const Gap(10),
              Text('Date',
                  style: getBodyTextStyle(
                    context,
                  )),
              const Gap(5),
              TextFormField(
                readOnly: true,
                controller: dateController,
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2050))
                      .then((value) {
                    if (value != null) {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(value);
                    }
                  });
                },
                decoration: const InputDecoration(
                  suffixIcon:
                      Icon(Icons.calendar_month, color: AppColors.primaryColor),
                ),
              ),
              const Gap(10),
              Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Time',
                          style: getBodyTextStyle(
                            context,
                          )),
                      const Gap(5),
                      TextFormField(
                        readOnly: true,
                        controller: startTimeController,
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              startTimeController.text = value.format(context);
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.access_time,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Time',
                          style: getBodyTextStyle(
                            context,
                          )),
                      const Gap(5),
                      TextFormField(
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              setState(() {
                                endTime = value.format(context);
                              });
                            }
                          });
                        },
                        decoration: InputDecoration(
                          hintText: endTime,
                          hintStyle: getBodyTextStyle(
                            context,
                          ),
                          suffixIcon: const Icon(
                            Icons.access_time,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              const Gap(30),
              Row(children: [
                Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: index == 0
                              ? AppColors.primaryColor
                              : index == 1
                                  ? AppColors.orangeColor
                                  : AppColors.redColor,
                          child: (selectedColor == index)
                              ? const Icon(Icons.check, color: Colors.white)
                              : const SizedBox(),
                        ),
                      ),
                    );
                  }),
                ),
                const Spacer(),
                CustomButton(
                    width: 145,
                    text: 'Create Task',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String id =
                            DateTime.now().toString() + titleController.text;
                        AppLocalStorage.cacheTaskData(
                            id,
                            TaskModel(
                                id: id,
                                title: titleController.text,
                                note: noteController.text,
                                date: dateController.text,
                                startTime: startTimeController.text,
                                endTime: endTime,
                                color: selectedColor,
                                isCompleted: false));
                        pushWithReplacement(context, const HomeView());
                      }
                    })
              ])
            ],
          ),
        ),
      ),
    );
  }
}
