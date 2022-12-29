import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/schedules_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_time.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/custom_button.dart';

class HoraireDeServiceShowModel extends StatefulWidget {
  final int dayOfWeek;
  final int part;
  TimeOfDay start;
  TimeOfDay end;

  HoraireDeServiceShowModel({Key? key, required this.dayOfWeek, required this.part, required this.start, required this.end}) : super(key: key);

  @override
  State<HoraireDeServiceShowModel> createState() => _HoraireDeServiceShowModelState();
}

class _HoraireDeServiceShowModelState extends State<HoraireDeServiceShowModel> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 25.h,
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
                            PickTime(
                              time: widget.start,
                              onTimeChanged: (time) {
                                setState(() {
                                  widget.start = time;
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "À",
                              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                            ),
                            PickTime(
                              time: widget.end,
                              onTimeChanged: (time) {
                                setState(() {
                                  widget.end = time;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      txt: "Valider",
                      fun: (startLoading, stopLoading, btnState) {
                        if (btnState == ButtonState.Idle) {
                          startLoading();
                          updateScheduleWS(
                            dayOfWeek: widget.dayOfWeek,
                            part: widget.part,
                            start: '${widget.start.hour}:${widget.start.minute}',
                            end: '${widget.end.hour}:${widget.end.minute}',
                          ).then((exceptionOrMessage) {
                            stopLoading();
                            exceptionOrMessage.fold(
                              (exception) {
                                Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                              },
                              (message) {
                                setState(() {});
                                Utils.showCustomTopSnackBar(context, success: true, message: message);
                                Navigator.pop(context);
                              },
                            );
                          });
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
