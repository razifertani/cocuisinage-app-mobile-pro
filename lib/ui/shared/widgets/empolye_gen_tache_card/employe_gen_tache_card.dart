import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../../utils/globals.dart';

class EmployeGenTacheCard extends StatelessWidget {
  final bool? pointe;
  const EmployeGenTacheCard({Key? key, this.pointe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 18.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    Globals.profile.getColleague(id: Globals.profile.id).imageUrl,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        '${Globals.profile.getColleague(id: Globals.profile.id).firstName} ${Globals.profile.getColleague(id: Globals.profile.id).lastName}',
                        maxLines: 1,
                        style: MyTextStyles.subhead,
                      ),
                      Text(
                        '${Globals.profile.getColleagueRole(id: Globals.profile.id).name}',
                        style: MyTextStyles.body,
                      ),
                      Text(
                        '${Globals.profile.getMyTasksForToday().length} tâches',
                        style: MyTextStyles.subhead,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: pointe ?? true ? Color(0xffD2F3DC) : Color(0xFFF8D5D9),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text(
                          pointe ?? true ? "Pointé" : "Non pointé",
                          style: MyTextStyles.buttonTextStyle.copyWith(color: pointe ?? true ? Color(0xFF2E9C61) : Color(0xFFD43347)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
