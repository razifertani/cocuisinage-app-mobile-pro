import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/tasks_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_home_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/haccp/pop_up_widget.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../Theme/my_colors.dart';

class MyFloatingActButtonHome extends StatefulWidget {
  final Function function;
  const MyFloatingActButtonHome({Key? key, required this.function})
      : super(key: key);

  @override
  State<MyFloatingActButtonHome> createState() =>
      _MyFloatingActButtonHomeState();
}

class _MyFloatingActButtonHomeState extends State<MyFloatingActButtonHome> {
  TextEditingController tache = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return

        // Visibility(
        //   visible: !Globals.profile.isOwner &&
        //       Globals.profile.isAvailableTargetPlanningForNow() &&
        //       Globals.profile.getPermissions().any((element) => [
        //             Permission.ADD_TASKS_TO_THE_TEAM
        //           ].contains(element.pivotEstablishmentsPermissions.permissionId)),
        //   child:
        // FloatingActionButton(
        //     backgroundColor: MyColors.red,
        //     onPressed: () {
        //       Planning planning =
        //           Globals.profile.getAvailableTargetPlanningForNow();

        //       // HAMED
        //       showDialog(
        //         context: context,
        //         builder: (_) => PopUpWidget(
        //           controller: tache,
        //           title: "Ajouter une tâche",
        //           function: (startLoading, stopLoading, btnState) {
        //             if (tache.text != '') {
        //               startLoading();
        //               addTaskWS(
        //                 collegueID: planning.professionalId,
        //                 taskName: tache.text,
        //                 planningID: planning.id,
        //               ).then((exceptionOrMessage) {
        //                 stopLoading();
        //                 exceptionOrMessage.fold(
        //                   (exception) {
        //                     setState(() {});
        //                     Utils.showCustomTopSnackBar(context,
        //                         success: false, message: exception.toString());
        //                   },
        //                   (message) {
        //                     setState(() {});
        //                     tache.clear();
        //                     Utils.showCustomTopSnackBar(context,
        //                         success: true, message: message);
        //                     Navigator.pop(context);
        //                   },
        //                 );
        //               });
        //             }
        //           },
        //         ),
        //       ).then((value) => widget.function());
        //       // then((value) => setState(() {}));
        //     },
        //     child: const Icon(Icons.add),
        //   ),
        // );

        FloatingActionButton(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor == Color(0xFFfafafa)
              ? Colors.white
              : Theme.of(context).primaryColor,
      onPressed: () {
        // HAMED
        print(Theme.of(context).scaffoldBackgroundColor);
        widget.function();
      },
      child: Image.asset(
        "assets/primary_icons/reservation.png",
        height: 40,
      ),
    );
  }
}
