import 'package:cocuisinage_app_mobile_pro/ui/screens/home/employe_home_screen.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/home/patron_home_screen.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/mon_equipe/mon_equipe_screen.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/planning/planning_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/globals.dart';
import '../screens/notifications/notifications.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    if (Globals.profile.isOwner) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatronHomeScreen()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeHomeScreen(
                            reload: () {},
                          ),
                        ),
                      );
                    }
                  },
                  child: Image.asset("assets/icons/home_outlined.png")),
              InkWell(
                  onTap: () {
                    // if (Globals.profile.isOwner) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlanningScreen()),
                    );
                    // } else {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => DetailPlanning(
                    //                 collegueID: Globals.profile.id,
                    //               )));
                    // }
                  },
                  child: Image.asset("assets/icons/calendar.png")),
              const SizedBox.shrink(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()),
                  );
                },
                child: Image.asset(
                  "assets/icons/notification_red.png",
                  height: 24,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MonEquipeScreen()),
                  );
                },
                child: Image.asset(
                  "assets/icons/equipes.png",
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
