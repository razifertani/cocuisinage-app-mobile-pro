import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/services/plannings_api.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/custom_button.dart';

class HoraireDeTravailAutreEmployePopUp extends StatefulWidget {
  final Planning planning;
  final int collegueID;
  final DateTime day;
  HoraireDeTravailAutreEmployePopUp({Key? key, required this.planning, required this.collegueID, required this.day}) : super(key: key);

  @override
  State<HoraireDeTravailAutreEmployePopUp> createState() => _HoraireDeTravailAutreEmployePopUpState();
}

class _HoraireDeTravailAutreEmployePopUpState extends State<HoraireDeTravailAutreEmployePopUp> {
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
            width: 85.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.planning.startedAt == null ? "Vous commencez votre jounrnée de travail à " : "Vous allez terminer à ",
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "${DateFormat.Hm().format(DateTime.now())}",
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  txt: widget.planning.startedAt == null ? "Commencer" : "Terminer",
                  fun: (startLoading, stopLoading, btnState) {
                    if (btnState == ButtonState.Idle) {
                      startLoading();
                      updatePlanningTimeWS(
                        id: widget.planning.id,
                        startedAt: widget.planning.startedAt ??
                            DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              DateTime.now().hour,
                              DateTime.now().minute,
                            ),
                        finishedAt: widget.planning.startedAt == null
                            ? null
                            : DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                DateTime.now().hour,
                                DateTime.now().minute,
                              ),
                      ).then((exceptionOrMessage) {
                        stopLoading();
                        exceptionOrMessage.fold(
                          (exception) {
                            Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                          },
                          (message) {
                            setState(() {});
                            Utils.showCustomTopSnackBar(context, success: true, message: message);
                            Navigator.of(context).pop();
                          },
                        );
                      });
                    }
                  },
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
