import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PatronTacheExpansionTile extends StatefulWidget {
  final int index;
  const PatronTacheExpansionTile({Key? key, required this.index}) : super(key: key);

  @override
  State<PatronTacheExpansionTile> createState() => _PatronTacheExpansionTileState();
}

class _PatronTacheExpansionTileState extends State<PatronTacheExpansionTile> {
  @override
  Widget build(BuildContext context) {
    Planning planning = Globals.profile.getColleguesPlanningsToday()[widget.index];

    return SizedBox(
      width: 95.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: ExpansionTile(
          collapsedTextColor: Colors.black,
          collapsedIconColor: Colors.black,
          iconColor: Colors.black,
          textColor: Colors.black,
          trailing: SizedBox(),
          title: Padding(
            padding: const EdgeInsets.all(4),
            child: FittedBox(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(
                      Globals.profile.getColleague(id: planning.professionalId).imageUrl,
                    ),
                    child: Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          print(32.w);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 36.w.clamp(130, 160),
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText('${Globals.profile.getColleague(id: planning.professionalId).firstName} ${Globals.profile.getColleague(id: planning.professionalId).lastName} ', maxLines: 1, style: MyTextStyles.subhead),
                              Text(
                                '${Globals.profile.getColleagueRole(id: planning.professionalId).name}',
                                style: MyTextStyles.body,
                              ),
                            ],
                          ),
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
                      borderRadius: BorderRadius.circular(10),
                      color: planning.status == Planning.NOT_YET
                          ? Color(0xFFF8D5D9)
                          : planning.status == Planning.IN_PROGRESS
                              ? Color(0xFFFFE6BA)
                              : planning.status == Planning.DONE
                                  ? Color(0xffD2F3DC)
                                  : Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: AutoSizeText(
                        planning.status == Planning.NOT_YET
                            ? Planning.NOT_YET_TEXT
                            : planning.status == Planning.IN_PROGRESS
                                ? Planning.IN_PROGRESS_TEXT
                                : planning.status == Planning.DONE
                                    ? Planning.DONE_TEXT
                                    : '!',
                        maxLines: 1,
                        style: MyTextStyles.buttonTextStyle.copyWith(
                          color: planning.status == Planning.NOT_YET
                              ? Color(0xFFD43347)
                              : planning.status == Planning.IN_PROGRESS
                                  ? Color(0xFFF9A413)
                                  : planning.status == Planning.DONE
                                      ? Color(0xFF2E9C61)
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
                      Image.asset("assets/icons/black_calendar.png"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${planning.tasks.length} tâches',
                        style: MyTextStyles.subhead,
                      ),
                      Spacer(),
                      planning.status != Planning.NOT_YET
                          ? RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Pointé en retard de ",
                                    style: MyTextStyles.body.copyWith(color: MyColors.red),
                                  ),
                                  TextSpan(
                                    text: "${planning.getDelayInMinutes()}",
                                    style: MyTextStyles.body.copyWith(color: MyColors.red, fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: " minutes",
                                    style: MyTextStyles.body.copyWith(color: MyColors.red),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: planning.tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 55.w,
                              child: AutoSizeText(
                                "${planning.tasks[index].name}",
                                style: MyTextStyles.headline,
                                maxLines: 3,
                              ),
                            ),
                            // Spacer(),
                            // Container(
                            //   decoration: BoxDecoration(color: Color(0xffFFE6BA), borderRadius: BorderRadius.circular(20)),
                            //   child: Center(
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(8.0),
                            //       child: Text(
                            //         planning.tasks[index].status == Task.DECLINED
                            //             ? Task.IGNORED_TEXT
                            //             : planning.tasks[index].status == Task.IGNORED
                            //                 ? Task.IGNORED_TEXT
                            //                 : planning.tasks[index].status == Task.ACCEPTED
                            //                     ? Task.ACCEPTED_TEXT
                            //                     : "",
                            //         style: MyTextStyles.body.copyWith(color: Color(0xFFF9A413)),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
