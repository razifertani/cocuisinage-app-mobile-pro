import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/planning/planning_employe.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/planning_widgets/planning_de_jour_emp_card.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';

class PlanningParJour extends StatefulWidget {
  DateTime selectedDate;
  int partOfTheDay;
  String text;
  PlanningParJour(
      {Key? key,
      required this.selectedDate,
      required this.partOfTheDay,
      required this.text})
      : super(key: key);

  @override
  State<PlanningParJour> createState() => _PlanningParJourState();
}

class _PlanningParJourState extends State<PlanningParJour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mon équipe",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              widget.text,
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: Globals.profile
                    .getColleguePlanningsByPart(
                        dateTime: widget.selectedDate,
                        part: widget.partOfTheDay)
                    .length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return PlanningDeJourEmpCard(
                    planning: Globals.profile.getColleguePlanningsByPart(
                        dateTime: widget.selectedDate,
                        part: widget.partOfTheDay)[index],
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlanningEmploye(
                            planning: Globals.profile
                                .getColleguePlanningsByPart(
                                    dateTime: widget.selectedDate,
                                    part: widget.partOfTheDay)[index],
                            selectedDate: widget.selectedDate,
                            partOfTheDay: widget.partOfTheDay,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
