import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/planning/planning_par_jour.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/planning_widgets/temps_equipe_card.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Theme/my_colors.dart';
import '../../shared/widgets/planning_widgets/horizontal_calendar.dart';
import '../drawer/drawer.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({Key? key}) : super(key: key);

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  DateTime selectedDate = DateTime.now();
  changeDate(DateTime date) {
    selectedDate = date;
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
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              HorizontalCalendar(
                initialDateTime: selectedDate,
                ondateChanged: changeDate,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mon équipe",
                style: MyTextStyles.headline,
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: Planning.DAY_PARTS.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return EquipeTimeCard(
                      plannings: Globals.profile.getColleguePlanningsByPart(
                          dateTime: selectedDate, part: index),
                      text:
                          "${DateFormat.EEEE('fr').format(selectedDate).capitalize()} ${Planning.DAY_PARTS.keys.elementAt(index)}",
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanningParJour(
                              selectedDate: selectedDate,
                              partOfTheDay: index,
                              text:
                                  "${DateFormat.EEEE('fr').format(selectedDate).capitalize()} ${Planning.DAY_PARTS.keys.elementAt(index)}",
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
