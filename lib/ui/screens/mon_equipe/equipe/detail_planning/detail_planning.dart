import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/mon_equipe/equipe/detail_planning/horaire_de_travail_autre_employe.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/mon_equipe/equipe/detail_planning/profil.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import 'horaire_de_travail_patron_popup.dart';

class DetailPlanning extends StatefulWidget {
  int collegueID;

  DetailPlanning({Key? key, required this.collegueID}) : super(key: key);

  @override
  State<DetailPlanning> createState() => _DetailPlanningState();
}

class _DetailPlanningState extends State<DetailPlanning> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // à changer
      _scrollController.jumpTo(currentMonthIndex * 70);
    });
  }

  var date = DateTime(2022, 1, 1);
  int currentMonthIndex = DateTime.now().month - 1;
  int weekdays = 7;
  int currentWeekIndex = (DateTime.now().day) ~/ 7;

  switchMonth(index) {
    currentMonthIndex = index;
    currentWeekIndex = 0;
    weekdays = 7;
    setState(() {});
  }

  switchWeek(index) {
    currentWeekIndex = index;
    weekdays = 7;
    setState(() {});
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Détails du planning",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(Globals.profile
                          .getColleague(id: widget.collegueID)
                          .imageUrl),
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
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${Globals.profile.getColleague(id: widget.collegueID).firstName} ${Globals.profile.getColleague(id: widget.collegueID).lastName}",
                          style: MyTextStyles.headline,
                        ),
                        Text(
                            "${Globals.profile.getColleagueRole(id: widget.collegueID).name}",
                            style: MyTextStyles.subhead
                                .copyWith(color: Color(0xFF5D5D5D))),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPlanningProfileScreen(
                                  collegueID: widget.collegueID,
                                ),
                              ),
                            ).then((value) => setState(() {}));
                          },
                          child: Text(
                            "Voir le profil",
                            style: MyTextStyles.subhead.copyWith(
                                decoration: TextDecoration.underline,
                                color: Color(0xFF5D5D5D)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Planning de ${DateFormat.MMMM('fr').format(DateTime(0, currentMonthIndex + 1))}",
                style: MyTextStyles.headline,
              ),
              SizedBox(
                height: 8.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: 12,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            switchMonth(index);

                            final contentSize =
                                (_scrollController.position.viewportDimension +
                                        _scrollController
                                            .position.maxScrollExtent) -
                                    index * 23;

                            final target = contentSize * currentMonthIndex / 12;
                            _scrollController.position.animateTo(
                              target,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SizedBox(
                            child: Text(
                              DateFormat.MMMM('fr').format(DateTime(
                                  date.year, date.month + index, date.day)),
                              style: MyTextStyles.cardTextStyle.copyWith(
                                color: currentMonthIndex == index
                                    ? MyColors.red
                                    : MyColors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      currentMonthIndex == 1 ? 4 : 5,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            switchWeek(index);
                          },
                          child: SizedBox(
                            height: 11.h,
                            width: 17.w,
                            child: Card(
                              color: currentWeekIndex == index
                                  ? MyColors.red
                                  : null,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Sem",
                                    style: currentWeekIndex == index
                                        ? MyTextStyles.headline
                                            .copyWith(color: Colors.white)
                                        : MyTextStyles.cardTextStyle.copyWith(
                                            color:
                                                MyColors.grey.withOpacity(0.8),
                                          ),
                                  ),
                                  Text(
                                    "${index + 1}",
                                    style: currentWeekIndex == index
                                        ? MyTextStyles.headline
                                            .copyWith(color: Colors.white)
                                        : MyTextStyles.cardTextStyle.copyWith(
                                            color:
                                                MyColors.grey.withOpacity(0.8),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(7, (index) {
                        final date = DateTime(
                            DateTime.now().year,
                            currentMonthIndex + 1,
                            (currentWeekIndex * 7) + index + 1);
                        if (date.month != currentMonthIndex + 1) {
                          weekdays--;
                          return const SizedBox();
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 6.5.h,
                            child: Text(
                              DateFormat.EEEE('fr').format(date) + " :",
                              style: MyTextStyles.headline,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  Column(
                    children: [
                      ...List.generate(7, (index) {
                        final dates = DateTime(
                            DateTime.now().year,
                            currentMonthIndex + 1,
                            (currentWeekIndex * 7) + index + 1);
                        if (dates.month != currentMonthIndex + 1) {
                          weekdays--;
                          return const SizedBox();
                        }

                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 8.h.clamp(70, 110),
                          width: 50.w,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: Globals.profile
                                      .getColleguePlanningsForDate(
                                          collegueID: widget.collegueID,
                                          date: DateTime(
                                              DateTime.now().year,
                                              currentMonthIndex + 1,
                                              (currentWeekIndex * 7) +
                                                  index +
                                                  1))
                                      .length +
                                  1,
                              itemBuilder: (context, i) {
                                if (i ==
                                    Globals.profile
                                        .getColleguePlanningsForDate(
                                            collegueID: widget.collegueID,
                                            date: DateTime(
                                                DateTime.now().year,
                                                currentMonthIndex + 1,
                                                (currentWeekIndex * 7) +
                                                    index +
                                                    1))
                                        .length) {
                                  return InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) =>
                                            HoraireDeTravailPatronPopUp(
                                          planning: Planning(
                                            id: 0,
                                            professionalId: widget.collegueID,
                                            establishmentId: Globals
                                                .params.currentEstablishmentID!,
                                            day: DateTime(
                                                DateTime.now().year,
                                                currentMonthIndex + 1,
                                                (currentWeekIndex * 7) +
                                                    index +
                                                    1),
                                            shouldStartAt: DateTime(
                                                DateTime.now().year,
                                                currentMonthIndex + 1,
                                                (currentWeekIndex * 7) +
                                                    index +
                                                    1,
                                                DateTime.now().hour,
                                                DateTime.now().minute),
                                            shouldFinishAt: DateTime(
                                                DateTime.now().year,
                                                currentMonthIndex + 1,
                                                (currentWeekIndex * 7) +
                                                    index +
                                                    1,
                                                DateTime.now().hour + 2,
                                                DateTime.now().minute),
                                            status: 0,
                                            tasks: [],
                                          ),
                                        ),
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Container(
                                      width: 45.w,
                                      child: Card(
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: MyColors.red,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  Planning planning = Globals.profile
                                      .getColleguePlanningsForDate(
                                          collegueID: widget.collegueID,
                                          date: DateTime(
                                              DateTime.now().year,
                                              currentMonthIndex + 1,
                                              (currentWeekIndex * 7) +
                                                  index +
                                                  1))[i];

                                  return InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) =>
                                            HoraireDeTravailPatronPopUp(
                                          planning: planning,
                                        ),
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Card(
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Center(
                                          child: AutoSizeText.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: planning.startedAt ==
                                                          null
                                                      ? '${DateFormat.Hm().format(planning.shouldStartAt)}'
                                                      : '${DateFormat.Hm().format(planning.startedAt!)}',
                                                  style: MyTextStyles
                                                      .cardTextStyle
                                                      .copyWith(
                                                    color: planning.startedAt ==
                                                            null
                                                        ? Colors.red
                                                        : Colors.green,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' - ',
                                                  style: MyTextStyles
                                                      .cardTextStyle,
                                                ),
                                                TextSpan(
                                                  text: planning.finishedAt ==
                                                          null
                                                      ? '${DateFormat.Hm().format(planning.shouldFinishAt!)}'
                                                      : '${DateFormat.Hm().format(planning.finishedAt!)}',
                                                  style: MyTextStyles
                                                      .cardTextStyle
                                                      .copyWith(
                                                    color:
                                                        planning.finishedAt ==
                                                                null
                                                            ? Colors.red
                                                            : Colors.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        );
                      }

                          // return Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       // Check if owner, who can add plannings to employees
                          //       if (Globals.profile.isOwner) {
                          //         // Owner cannot add plannings to his profile
                          //         if (Globals.profile.id != widget.collegueID) {
                          //           // Check if the selected date is today or later
                          //           if (DateTime(DateTime.now().year, currentMonthIndex + 1, (currentWeekIndex * 7) + index + 1, DateTime.now().hour, DateTime.now().minute + 5).isAfter(DateTime.now())) {
                          //             showDialog(
                          //               context: context,
                          //               builder: (_) => HoraireDeTravailPatronPopUp(
                          //                 collegueID: widget.collegueID,
                          //                 day: DateTime(DateTime.now().year, currentMonthIndex + 1, (currentWeekIndex * 7) + index + 1),
                          //               ),
                          //             ).then((value) => setState(() {}));
                          //           } else {
                          //             Utils.showCustomTopSnackBar(context, success: false, message: 'Vous ne pouvez pas affecter des créneaux pour des jours antérieurs !');
                          //           }
                          //         } else {
                          //           Utils.showCustomTopSnackBar(context, success: false, message: 'Vous ne pouvez pas affecter des créneaux à votre profil !');
                          //         }
                          //       }
                          //     },
                          //     child: SizedBox(
                          //       height: 8.h,
                          //       width: 45.w,
                          //       child: Card(
                          //         color: Globals.profile.isOwner
                          //             ? (DateTime(DateTime.now().year, currentMonthIndex + 1, (currentWeekIndex * 7) + index + 1, DateTime.now().hour, DateTime.now().minute + 5).isAfter(DateTime.now()))
                          //                 ? null
                          //                 : Color(0xFFE7E7E7)
                          //             : null,
                          //         elevation: 3,
                          //         child: Globals.profile.getColleguePlanningsForDate(collegueID: widget.collegueID, date: DateTime(DateTime.now().year, currentMonthIndex + 1, (currentWeekIndex * 7) + index + 1)).length == 0 && (DateTime(DateTime.now().year, currentMonthIndex + 1, (currentWeekIndex * 7) + index + 1, DateTime.now().hour, DateTime.now().minute + 5).isAfter(DateTime.now()))
                          //             ? Icon(
                          //                 Icons.calendar_month,
                          //                 color: MyColors.red,
                          //               )
                          //             : ListView.builder(
                          //                 scrollDirection: Axis.horizontal,
                          //                 shrinkWrap: true,
                          //                 physics: BouncingScrollPhysics(),
                          //                 itemCount: Globals.profile.getColleguePlanningsForDate(collegueID: widget.collegueID, date: DateTime(DateTime.now().year, currentMonthIndex + 1, (currentWeekIndex * 7) + index + 1)).length,
                          //                 itemBuilder: (context, i) {
                          //                   Planning planning = Globals.profile.getColleguePlanningsForDate(collegueID: widget.collegueID, date: DateTime(DateTime.now().year, currentMonthIndex + 1, (currentWeekIndex * 7) + index + 1))[i];

                          //                   return Padding(
                          //                     padding: const EdgeInsets.symmetric(horizontal: 4),
                          //                     child: Center(
                          //                       child: AutoSizeText.rich(
                          //                         TextSpan(
                          //                           children: [
                          //                             TextSpan(
                          //                               text: planning.startedAt == null ? '${DateFormat.Hm().format(planning.shouldStartAt)}' : '${DateFormat.Hm().format(planning.startedAt!)}',
                          //                               style: MyTextStyles.cardTextStyle.copyWith(
                          //                                 color: planning.startedAt == null ? Colors.red : Colors.green,
                          //                               ),
                          //                             ),
                          //                             TextSpan(
                          //                               text: ' - ',
                          //                               style: MyTextStyles.cardTextStyle,
                          //                             ),
                          //                             TextSpan(
                          //                               text: planning.finishedAt == null ? '${DateFormat.Hm().format(planning.shouldFinishAt!)}' : '${DateFormat.Hm().format(planning.finishedAt!)}',
                          //                               style: MyTextStyles.cardTextStyle.copyWith(
                          //                                 color: planning.finishedAt == null ? Colors.red : Colors.green,
                          //                               ),
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   );
                          //                 },
                          //               ),
                          //       ),
                          //     ),
                          //   ),
                          // );
                          ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
