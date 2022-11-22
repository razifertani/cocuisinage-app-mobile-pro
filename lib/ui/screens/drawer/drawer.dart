import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/controllers/theme_controller.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../../services/auth_api.dart';
import '../../../utils/utils.dart';
import '../auth/mes_boutiques/mes_boutiques.dart';
import '../auth/sign_in/sign_in.dart';

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
