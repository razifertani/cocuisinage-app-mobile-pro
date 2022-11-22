import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/plannings_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PointagePopUp extends StatefulWidget {
  final Function function;
  const PointagePopUp({Key? key, required this.function}) : super(key: key);

  @override
  State<PointagePopUp> createState() => _PointagePopUpState();
}

class _PointagePopUpState extends State<PointagePopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 30.h,
            width: 85.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${DateFormat.MMMMEEEEd('fr').format(DateTime.now())}",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   "De ${DateFormat.Hm().format(planning.shouldStartAt)} à ${DateFormat.Hm().format(planning.shouldFinishAt)}",
                  //   style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Salut ${Globals.profile.firstName}",
                    style: MyTextStyles.body.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    Globals.profile.isAvailableTargetPlanningForNow()
                        ? Globals.profile
                                    .getAvailableTargetPlanningForNow()
                                    .startedAt ==
                                null
                            ? "Pointez pour marquer que vous avez commencé votre travail"
                            : "Pointez pour marquer que vous avez terminé votre travail"
                        : "Pointez pour marquer que vous avez commencé votre travail",
                    style: MyTextStyles.body.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ArgonButton(
                    height: 8.h,
                    width: 40.w,
                    minWidth: 40.w,
                    elevation: 3,
                    color: Colors.white,
                    borderRadius: 15.0,
                    roundLoadingShape: false,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: AutoSizeText(
                      "${DateFormat.Hm().format(DateTime.now())}",
                      maxLines: 1,
                      style: MyTextStyles.subhead.copyWith(color: Colors.green),
                    ),
                    loader: SpinKitRing(
                      color: Colors.green,
                      size: 40,
                      lineWidth: 4,
                    ),
                    onTap: (startLoading, stopLoading, btnState) {
                      startLoading();

                      if (Globals.profile.isAvailableTargetPlanningForNow()) {
                        Planning availableTargetPlanningForNow =
                            Globals.profile.getAvailableTargetPlanningForNow();

                        updatePlanningTimeWS(
                          id: availableTargetPlanningForNow.id,
                          startedAt: availableTargetPlanningForNow.startedAt ??
                              DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  DateTime.now().hour,
                                  DateTime.now().minute),
                          finishedAt:
                              availableTargetPlanningForNow.startedAt == null
                                  ? null
                                  : DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      DateTime.now().hour,
                                      DateTime.now().minute),
                        ).then((exceptionOrMessage) {
                          stopLoading();
                          exceptionOrMessage.fold(
                            (exception) {
                              Utils.showCustomTopSnackBar(context,
                                  success: false,
                                  message: exception.toString());
                            },
                            (message) {
                              setState(() {});
                              Utils.showCustomTopSnackBar(context,
                                  success: true, message: message);
                              Navigator.of(context).pop();
                            },
                          );
                        }).then((value) => widget.function());
                      } else {
                        addPlanningWS(
                          professionalId: Globals.profile.id,
                          day: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day),
                          shouldStartAt: DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              DateTime.now().hour,
                              DateTime.now().minute),
                          startedAt: DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              DateTime.now().hour,
                              DateTime.now().minute),
                        ).then((exceptionOrMessage) {
                          widget.function();
                          stopLoading();
                          exceptionOrMessage.fold(
                            (exception) {
                              Utils.showCustomTopSnackBar(context,
                                  success: false,
                                  message: exception.toString());
                            },
                            (message) {
                              setState(() {});
                              Utils.showCustomTopSnackBar(context,
                                  success: true, message: message);
                              Navigator.of(context).pop();
                            },
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
