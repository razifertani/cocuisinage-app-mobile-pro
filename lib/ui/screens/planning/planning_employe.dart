import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/tasks_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/haccp/pop_up_widget.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../../utils/globals.dart';
import '../../shared/widgets/tache/employe_tache_widget.dart';

class PlanningEmploye extends StatefulWidget {
  final Planning planning;
  final DateTime selectedDate;
  final int partOfTheDay;

  const PlanningEmploye({
    Key? key,
    required this.planning,
    required this.selectedDate,
    required this.partOfTheDay,
  }) : super(key: key);

  @override
  State<PlanningEmploye> createState() => _PlanningEmployeState();
}

class _PlanningEmployeState extends State<PlanningEmploye> {
  TextEditingController tache = TextEditingController();

  void reloadStateCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // floatingActionButton: const MyFloatingActButtonHome(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: const MyBottomNavigationBar(),
      appBar: AppBar(
        title: Text(
          "Planning",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(
                    Globals.profile
                        .getColleague(id: widget.planning.professionalId)
                        .imageUrl,
                  ),
                  child: Material(
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 42.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '${Globals.profile.getColleague(id: widget.planning.professionalId).firstName} ${Globals.profile.getColleague(id: widget.planning.professionalId).lastName}',
                        maxLines: 1,
                        style: MyTextStyles.headline,
                      ),
                      Text(
                        '${Globals.profile.getColleagueRole(id: widget.planning.professionalId).name}',
                        style: MyTextStyles.body,
                      ),
                    ],
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: Globals.profile
                    .getCollegueTasksForPart(
                        collegueID: widget.planning.professionalId,
                        dateTime: widget.selectedDate,
                        part: widget.partOfTheDay)
                    .length,
                itemBuilder: (context, index) {
                  // HAMED
                  return EmployeTacheWidget(
                    reloadParentCallback: reloadStateCallback,
                    task: Globals.profile.getCollegueTasksForPart(
                        collegueID: widget.planning.professionalId,
                        dateTime: widget.selectedDate,
                        part: widget.partOfTheDay)[index],
                  );
                },
              ),
              if (Globals.profile.getPermissions().any((element) => [
                    Permission.ADD_TASKS_TO_THE_TEAM
                  ].contains(
                      element.pivotEstablishmentsPermissions.permissionId)))
                CustomButton(
                  txt: "Ajouter une tâche",
                  fun: (startLoading, stopLoading, btnState) {
                    if (btnState == ButtonState.Idle) {
                      showDialog(
                        context: context,
                        builder: (_) => PopUpWidget(
                          controller: tache,
                          title: "Ajouter une tâche",
                          function: (startLoading, stopLoading, btnState) {
                            if (tache.text != '') {
                              startLoading();
                              addTaskWS(
                                collegueID: widget.planning.professionalId,
                                taskName: tache.text,
                                planningID: widget.planning.id,
                              ).then((exceptionOrMessage) {
                                stopLoading();
                                exceptionOrMessage.fold(
                                  (exception) {
                                    setState(() {});
                                    Utils.showCustomTopSnackBar(context,
                                        success: false,
                                        message: exception.toString());
                                  },
                                  (message) {
                                    setState(() {});
                                    tache.clear();
                                    Utils.showCustomTopSnackBar(context,
                                        success: true, message: message);
                                    Navigator.pop(context);
                                  },
                                );
                              });
                            }
                          },
                        ),
                      );
                    }
                  },
                ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
