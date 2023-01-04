import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/controllers/theme_controller.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/planning_widgets/horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';
import '../../../../Theme/my_colors.dart';

import '../../../Theme/my_text_styles.dart';
import '../../shared/custom_card.dart';
import '../drawer/drawer.dart';
import '../tutoriel/tutoriel_pop_up.dart';
import 'commandes_annules.dart';
import 'commandes_confirmes.dart';
import 'commandes_en_attentes.dart';

class MesCommandesScreen extends StatefulWidget {
  const MesCommandesScreen({Key? key}) : super(key: key);

  @override
  State<MesCommandesScreen> createState() => _MesCommandesScreenState();
}

class _MesCommandesScreenState extends State<MesCommandesScreen> {
  var myGroup = AutoSizeGroup();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            child: AutoSizeText(
              'Confirmé',
              group: myGroup,
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(color: Theme.of(context).scaffoldBackgroundColor != Colors.black ? Colors.black : null),
            ),
          ),
          Tab(
            child: AutoSizeText(
              'En attente',
              group: myGroup,
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(color: Theme.of(context).scaffoldBackgroundColor != Colors.black ? Colors.black : null),
            ),
          ),
          Tab(
            child: AutoSizeText(
              'Annulé',
              group: myGroup,
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(color: Theme.of(context).scaffoldBackgroundColor != Colors.black ? Colors.black : null),
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
                builder: (context, value, child) => ColoredBox(color: value.dark ? Colors.black : Colors.white, child: _tabBar),
              ),
            ),
            title: Text(
              "Mes Commandes",
              style: MyTextStyles.appBarTextStyle,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => TutorielPopUp(
                            title: "Mes commandes",
                            description: "Vous pouvez gérer l’ensemble des commandes effectuées en ligne  ",
                            numberOfPages: 3,
                            secDescription: "La commande en attente sera à confirmer ou refusé. vous retrouverez l’ensemble des informations essentielles à la commande.",
                            thirdDescription: "Si la commande est validée alors elle sera transmise au système de préparation de commande  et un compteur de préparation sera enclenché.",
                          ));
                },
                icon: Icon(Icons.question_mark),
              )
            ],
            centerTitle: true,
            backgroundColor: MyColors.red,
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    HorizontalCalendar(),
                    CommandesConfirm(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    HorizontalCalendar(),
                    CommandesEnAttentes(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    HorizontalCalendar(),
                    CommadesAnnules(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
