import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/controllers/theme_controller.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mon_equipe/roles/roles_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

import '../../shared/bottom_app_bar.dart';
import '../../shared/floating_action_button_home.dart';
import '../drawer/drawer.dart';
import 'equipe/equipe.dart';

import 'roles/permissions_screen.dart';

class MonEquipeScreen extends StatefulWidget {
  MonEquipeScreen({Key? key}) : super(key: key);

  @override
  State<MonEquipeScreen> createState() => _MonEquipeScreenState();
}

class _MonEquipeScreenState extends State<MonEquipeScreen> {
  TextEditingController rech = TextEditingController();

  int currentIndex = 0;

  switchTag(int value) {
    currentIndex = value;
    setState(() {});
  }

  var myGroup = AutoSizeGroup();
  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            child: AutoSizeText(
              'L’équipe',
              group: myGroup,
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor != Colors.black
                    ? Colors.black
                    : null,
              ),
            ),
          ),
          Tab(
            child: AutoSizeText(
              'Rôles',
              group: myGroup,
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
            ),
          ),
          Tab(
            child: AutoSizeText(
              'Permissions',
              group: myGroup,
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Consumer<ThemeController>(
                builder: (context, value, child) => ColoredBox(
                  color: value.dark ? Colors.black : Colors.white,
                  child: _tabBar,
                ),
              ),
            ),
            title: Text(
              "Mon équipe",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (_) => TutorielPopUp(
                  //           title: "Mon équipe",
                  //           description: "Vous pouvez  ajouter de nouveaux employés à votre équipe avec ses informations essentielles (identité du client,métier, horaires de travail,...)",
                  //           numberOfPages: 3,
                  //           secDescription: "Vous pouvez visualiser le planning de l’ensemble de votre salariés. Vous pouvez affecter de nouvelles tâches aux salariés de votre équipe",
                  //           thirdDescription: "Vous pouvez ajouter des accès personnalisés à l’application.",
                  //         ));
                },
                icon: const Icon(Icons.question_mark),
              )
            ],
            backgroundColor: MyColors.red,
          ),
          body: TabBarView(
            children: [
              Equipe(),
              RolesScreen(),
              PermissionsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
