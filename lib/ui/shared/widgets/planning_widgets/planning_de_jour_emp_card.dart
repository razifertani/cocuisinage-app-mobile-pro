import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlanningDeJourEmpCard extends StatelessWidget {
  Planning planning;
  Function function;
  PlanningDeJourEmpCard({Key? key, required this.planning, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: SizedBox(
        height: 12.h,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Globals.profile.getColleague(id: planning.professionalId).firstName} ${Globals.profile.getColleague(id: planning.professionalId).lastName}',
                      style: MyTextStyles.headline,
                    ),
                    Text(
                      '${Globals.profile.getColleagueRole(id: planning.professionalId).name}',
                      style: MyTextStyles.body,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
