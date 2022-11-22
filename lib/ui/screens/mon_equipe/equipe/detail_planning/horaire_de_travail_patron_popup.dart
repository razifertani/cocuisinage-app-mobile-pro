import 'dart:convert';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/services/plannings_api.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/custom_button.dart';

class HoraireDeTravailPatronPopUp extends StatefulWidget {
  final Planning planning;
  const HoraireDeTravailPatronPopUp({Key? key, required this.planning}) : super(key: key);

  @override
  State<HoraireDeTravailPatronPopUp> createState() => _HoraireDeTravailPatronPopUpState();
}

class _HoraireDeTravailPatronPopUpState extends State<HoraireDeTravailPatronPopUp> {
  late Planning planning;
  bool isMonthly = false;

  @override
  void initState() {
    super.initState();

    planning = Planning(
      id: widget.planning.id,
      professionalId: widget.planning.professionalId,
      establishmentId: widget.planning.establishmentId,
      day: widget.planning.day,
      shouldStartAt: widget.planning.shouldStartAt,
      shouldFinishAt: widget.planning.shouldFinishAt,
      startedAt: widget.planning.startedAt,
      finishedAt: widget.planning.finishedAt,
      status: widget.planning.status,
      tasks: widget.planning.tasks,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 35.h,
            width: 80.w,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "De",
                              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Card(
                              elevation: 3,
                              child: GestureDetector(
                                onTap: () async {
                                  final TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(hour: planning.shouldStartAt.hour, minute: planning.shouldStartAt.minute),
                                    builder: (BuildContext context, Widget? child) {
                                      return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: child!);
                                    },
                                  );
                                  if (newTime != null) {
                                    setState(() {
                                      planning.shouldStartAt = DateTime(
                                        planning.day.year,
                                        planning.day.month,
                                        planning.day.day,
                                        newTime.hour,
                                        newTime.minute,
                                      );
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                  child: Text(
                                    DateFormat.Hm().format(planning.shouldStartAt),
                                    style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "À",
                              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Card(
                              elevation: 3,
                              child: GestureDetector(
                                onTap: () async {
                                  final TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(hour: planning.shouldFinishAt!.hour, minute: planning.shouldFinishAt!.minute),
                                    builder: (BuildContext context, Widget? child) {
                                      return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: child!);
                                    },
                                  );
                                  if (newTime != null) {
                                    setState(() {
                                      planning.shouldFinishAt = DateTime(
                                        planning.day.year,
                                        planning.day.month,
                                        planning.day.day,
                                        newTime.hour,
                                        newTime.minute,
                                      );
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                  child: Text(
                                    DateFormat.Hm().format(planning.shouldFinishAt!),
                                    style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (planning.id == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mensuel",
                            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Switch(
                            activeColor: MyColors.red,
                            value: isMonthly,
                            onChanged: (value) {
                              setState(() {
                                isMonthly = value;
                              });
                            },
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      txt: "Valider",
                      fun: (startLoading, stopLoading, btnState) async {
                        if (btnState == ButtonState.Idle) {
                          startLoading();
                          if (planning.id == 0) {
                            await addPlanningWS(
                              professionalId: planning.professionalId,
                              day: planning.day,
                              shouldStartAt: planning.shouldStartAt,
                              startedAt: planning.startedAt,
                              shouldFinishAt: planning.shouldFinishAt,
                              monthly: isMonthly,
                            ).then((exceptionOrMessage) {
                              stopLoading();
                              exceptionOrMessage.fold(
                                (exception) {
                                  Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                },
                                (message) {
                                  Utils.showCustomTopSnackBar(context, success: true, message: message);
                                  Navigator.of(context).pop();
                                },
                              );
                            });
                          } else {
                            await updatePlanningWS(
                              planning: planning,
                              monthly: isMonthly,
                            ).then((exceptionOrMessage) {
                              stopLoading();
                              exceptionOrMessage.fold(
                                (exception) {
                                  Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                },
                                (message) {
                                  Utils.showCustomTopSnackBar(context, success: true, message: message);
                                  Navigator.of(context).pop();
                                },
                              );
                            });
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
