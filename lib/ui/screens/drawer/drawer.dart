import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/controllers/theme_controller.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../../services/auth_api.dart';
import '../../../utils/utils.dart';
import '../../shared/widgets/drawer/expansion_tile.dart';
import '../auth/mes_boutiques/mes_boutiques.dart';
import '../auth/sign_in/sign_in.dart';
import '../mes_statistiques/statistique_main_screen.dart';
import '../planning/planning_screen.dart';
import '../porte_monnaie.dart/porte_monnaie_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 80.w,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFFBC06D),
                    Color(0xFFF3939A),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: MyColors.red,
                      child: CircleAvatar(
                        radius: 36,
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
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Globals.profile.getFullName()}',
                          style: MyTextStyles.headline
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${Globals.profile.getRole().name}',
                          style: MyTextStyles.headline,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                          child: Image.asset(
                            "assets/drawer_icons/changer.png",
                            // height: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MesBoutiquesScreen()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: FittedBox(
                            child: AutoSizeText(
                              "Changer de la boutique",
                              style: MyTextStyles.subhead
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpansionTileDrawer(
                    title: "Statistiques",
                    iconPath: "assets/drawer_icons/stat.png",
                    widgets: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MonPorteMonnaieScreen()),
                          );
                        },
                        child: Text(
                          "Porte monnaie",
                          style: MyTextStyles.subhead,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatistiqueMainScreen()),
                          );
                        },
                        child: Text(
                          "Statistique de plat",
                          style: MyTextStyles.subhead,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 10,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                          child: Image.asset("assets/icons/calendar.png"),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlanningScreen()),
                            );
                          },
                          child: FittedBox(
                            child: AutoSizeText(
                              "Planning",
                              style: MyTextStyles.subhead
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset("assets/drawer_icons/dark_theme.png"),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Dark theme",
                        style: MyTextStyles.subhead
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Consumer<ThemeController>(
                        builder: (context, value, child) => SizedBox(
                          width: 12.w,
                          child: FittedBox(
                            child: Switch(
                                activeColor: MyColors.red,
                                value: value.dark,
                                onChanged: (_) {
                                  print(value.dark);
                                  value.switchTheme();
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35,
                          child: Icon(
                            Icons.logout,
                            color: MyColors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            logoutWS().then((exceptionOrBool) {
                              exceptionOrBool.fold(
                                (exception) {
                                  Utils.showCustomTopSnackBar(
                                    context,
                                    success: false,
                                    message: exception.toString(),
                                  );
                                },
                                (bool) {
                                  Globals.params.currentEstablishmentID = null;

                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInScreen()),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                              );
                            });
                          },
                          child: FittedBox(
                            child: AutoSizeText(
                              "Déconnexion",
                              style: MyTextStyles.subhead
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
