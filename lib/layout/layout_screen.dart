import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../ui/screens/home/employe_home_screen.dart';
import '../ui/screens/home/patron_home_screen.dart';
import '../ui/screens/mes_commandes/mes_commandes_screen.dart';
import '../ui/screens/mon_equipe/mon_equipe_screen.dart';
import '../ui/screens/notifications/notifications.dart';
import '../ui/screens/planning/planning_screen.dart';
import '../ui/screens/reservation/reservation_home_screen.dart';
import '../ui/shared/floating_action_button_home.dart';
import '../utils/globals.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentItemIndex = 0;

  switchIndex(int index) {
    currentItemIndex = index;
    setState(() {});
  }

  getPage(int index) {
    switch (index) {
      case 0:
        return Globals.profile.isOwner
            ? PatronHomeScreen()
            : EmployeHomeScreen(
                reload: () => setState(() {}),
              );
      case 1:
        return MesCommandesScreen();
      // return PlanningScreen();
      case 2:
        return NotificationScreen();
      case 3:
        return MonEquipeScreen();
      case 4:
        return ReservationHomeScreen();
      default:
        return const PatronHomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: MyFloatingActButtonHome(
          function: () {
            switchIndex(4);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: getPage(currentItemIndex),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 10.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          switchIndex(0);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/home_outlined.png",
                              height: 25,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Acceuil",
                              style: MyTextStyles.body.copyWith(
                                  color: MyColors.red,
                                  fontSize: 15.sp.clamp(10, 16),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          switchIndex(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/commande.png",
                              height: 25,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Commandes",
                              style: MyTextStyles.body.copyWith(
                                  color: MyColors.red,
                                  fontSize: 15.sp.clamp(10, 16),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    const SizedBox.shrink(),
                    InkWell(
                        onTap: () {
                          switchIndex(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/notification_red.png",
                              height: 25,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Notification",
                              style: MyTextStyles.body.copyWith(
                                  color: MyColors.red,
                                  fontSize: 15.sp.clamp(10, 16),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          switchIndex(3);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/equipes.png",
                              height: 25,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Equipe",
                              style: MyTextStyles.body.copyWith(
                                  color: MyColors.red,
                                  fontSize: 15.sp.clamp(10, 16),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                  ]),
            ),
          ),
        ));
  }
}
