import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/drawer/drawer.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/bottom_app_bar.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/pointage_popups/pointage_popup.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/tache/employe_tache_widget.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

import '../../shared/floating_action_button_home.dart';

class EmployeHomeScreen extends StatefulWidget {
  final VoidCallback reload;
  EmployeHomeScreen({Key? key, required this.reload}) : super(key: key);

  @override
  State<EmployeHomeScreen> createState() => _EmployeHomeScreenState();
}

class _EmployeHomeScreenState extends State<EmployeHomeScreen> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // resizeToAvoidBottomInset: false,
          // floatingActionButton: const MyFloatingActButtonHome(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: const MyBottomNavigationBar(),
          appBar: AppBar(
            title: Text(
              "Mes tâches",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: MyColors.red,
          ),
          drawer: MyDrawer(),
          body: SmartRefresher(
            controller: refreshController,
            enablePullDown: true,
            header: ClassicHeader(),
            onRefresh: () async {
              Globals.profile = await getUserWS();
              setState(() {});
              refreshController.refreshCompleted();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            Globals.profile.imageUrl,
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
                                '${Globals.profile.firstName} ${Globals.profile.lastName}',
                                maxLines: 1,
                                style: MyTextStyles.headline,
                              ),
                              Text(
                                '${Globals.profile.getRole().name}',
                                style: MyTextStyles.body,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Globals.profile.getMyPlanningsForToday().isEmpty
                        ? Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.asset("assets/images/repos.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Vous êtes en repos aujourd’hui',
                                style: MyTextStyles.body
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount:
                                Globals.profile.getMyPlanningsForToday().length,
                            itemBuilder: (context, index1) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ExpansionTile(
                                  trailing: SizedBox(),
                                  // collapsedTextColor: Colors.black,
                                  collapsedIconColor: Colors.black,
                                  iconColor: Colors.black,
                                  // textColor: Colors.black,
                                  title: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: FittedBox(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 26,
                                            backgroundImage: NetworkImage(
                                              Globals.profile.imageUrl,
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
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Center(
                                            child: SizedBox(
                                              width: 32.w.clamp(120, 160),
                                              child: FittedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      '${Globals.profile.firstName} ${Globals.profile.lastName} ',
                                                      maxLines: 1,
                                                      style:
                                                          MyTextStyles.subhead,
                                                    ),
                                                    Text(
                                                      '${Globals.profile.getRole().name}',
                                                      style: MyTextStyles.body,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 30.w.clamp(80, 110),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Globals.profile
                                                          .getMyPlanningsForToday()[
                                                              index1]
                                                          .status ==
                                                      Planning.NOT_YET
                                                  ? Color(0xFFF8D5D9)
                                                  : Globals.profile
                                                              .getMyPlanningsForToday()[
                                                                  index1]
                                                              .status ==
                                                          Planning.IN_PROGRESS
                                                      ? Color(0xFFFFE6BA)
                                                      : Globals.profile
                                                                  .getMyPlanningsForToday()[
                                                                      index1]
                                                                  .status ==
                                                              Planning.DONE
                                                          ? Color(0xffD2F3DC)
                                                          : Colors.black,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                              child: AutoSizeText(
                                                Globals.profile
                                                            .getMyPlanningsForToday()[
                                                                index1]
                                                            .status ==
                                                        Planning.NOT_YET
                                                    ? Planning.NOT_YET_TEXT
                                                    : Globals.profile
                                                                .getMyPlanningsForToday()[
                                                                    index1]
                                                                .status ==
                                                            Planning.IN_PROGRESS
                                                        ? Planning
                                                            .IN_PROGRESS_TEXT
                                                        : Globals.profile
                                                                    .getMyPlanningsForToday()[
                                                                        index1]
                                                                    .status ==
                                                                Planning.DONE
                                                            ? Planning.DONE_TEXT
                                                            : '!',
                                                maxLines: 1,
                                                style: MyTextStyles
                                                    .buttonTextStyle
                                                    .copyWith(
                                                  color: Globals.profile
                                                              .getMyPlanningsForToday()[
                                                                  index1]
                                                              .status ==
                                                          Planning.NOT_YET
                                                      ? Color(0xFFD43347)
                                                      : Globals.profile
                                                                  .getMyPlanningsForToday()[
                                                                      index1]
                                                                  .status ==
                                                              Planning
                                                                  .IN_PROGRESS
                                                          ? Color(0xFFF9A413)
                                                          : Globals.profile
                                                                      .getMyPlanningsForToday()[
                                                                          index1]
                                                                      .status ==
                                                                  Planning.DONE
                                                              ? Color(
                                                                  0xFF2E9C61)
                                                              : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  children: [
                                    Divider(
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/icons/black_calendar.png"),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${Globals.profile.getMyPlanningsForToday()[index1].tasks.length} tâches',
                                                style: MyTextStyles.subhead,
                                              ),
                                              Spacer(),
                                              Globals.profile
                                                          .getMyPlanningsForToday()[
                                                              index1]
                                                          .getDelayInMinutes() ==
                                                      0
                                                  ? Container()
                                                  : RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                "Pointé en retard de ",
                                                            style: MyTextStyles
                                                                .body
                                                                .copyWith(
                                                                    color:
                                                                        MyColors
                                                                            .red),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                "${Globals.profile.getMyPlanningsForToday()[index1].getDelayInMinutes()}",
                                                            style: MyTextStyles
                                                                .body
                                                                .copyWith(
                                                                    color:
                                                                        MyColors
                                                                            .red),
                                                          ),
                                                          TextSpan(
                                                            text: " min",
                                                            style: MyTextStyles
                                                                .body
                                                                .copyWith(
                                                                    color:
                                                                        MyColors
                                                                            .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            itemCount: Globals.profile
                                                .getMyPlanningsForToday()[
                                                    index1]
                                                .tasks
                                                .length,
                                            itemBuilder: (context, index2) {
                                              return EmployeTacheWidget(
                                                reloadParentCallback: () {
                                                  setState(() {});
                                                },
                                                task: Globals.profile
                                                    .getMyPlanningsForToday()[
                                                        index1]
                                                    .tasks[index2],
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        showTimeButton()
            ? Positioned(
                bottom: -4.h,
                right: -9.w,
                child: AvatarGlow(
                  glowColor: Globals.profile.isAvailableTargetPlanningForNow()
                      ? MyColors.red
                      : Colors.white,
                  endRadius: 90.0,
                  duration: Duration(milliseconds: 2000),
                  repeatPauseDuration: Duration(milliseconds: 100),
                  repeat: true,
                  showTwoGlows: true,
                  child: GestureDetector(
                    onTap: () async {
                      if (Globals.profile.getPermissions().any((element) =>
                          element.pivotEstablishmentsPermissions.permissionId ==
                          Permission.REMOTE_WORK)) {
                        showDialog(
                          context: context,
                          builder: (_) => PointagePopUp(
                            function: () {
                              setState(() {});
                            },
                          ),
                        ).then((value) => widget.reload());
                      } else {
                        await Geolocator.getCurrentPosition(
                          forceAndroidLocationManager: false,
                          desiredAccuracy: LocationAccuracy.best,
                        ).then((position) {
                          double distanceInMeters = Geolocator.distanceBetween(
                            position.latitude,
                            position.longitude,
                            double.parse(
                                Globals.profile.getEstablishment().latitude),
                            double.parse(
                                Globals.profile.getEstablishment().longitude),
                          );

                          if (distanceInMeters < 10) {
                            // Hamed
                            showDialog(
                              context: context,
                              builder: (_) => PointagePopUp(
                                function: () {
                                  setState(() {});
                                },
                              ),
                            ).then((value) => widget.reload());
                          } else {
                            Utils.showCustomTopSnackBar(
                              context,
                              success: false,
                              message:
                                  "Vous êtes encore loin de votre établissement ! (${distanceInMeters.toInt()} Mètres)",
                            );
                          }
                        });
                      }
                    },
                    child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: Image.asset("assets/icons/red_finger_print.png"),
                        radius: 40.0,
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

bool showTimeButton() {
  if (Globals.profile.getPermissions().any((element) =>
      element.pivotEstablishmentsPermissions.permissionId ==
      Permission.FREE_WORK)) {
    return true;
  } else if (Globals.profile.isAvailableTargetPlanningForNow()) {
    return true;
  }
  return false;
}
