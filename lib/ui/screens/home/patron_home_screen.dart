import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/bottom_app_bar.dart';
import '../../shared/floating_action_button_home.dart';
import '../../shared/widgets/taches_expansion_tile/patron_tache_expansion_tile.dart';
import '../drawer/drawer.dart';

class PatronHomeScreen extends StatefulWidget {
  const PatronHomeScreen({Key? key}) : super(key: key);

  @override
  State<PatronHomeScreen> createState() => _PatronHomeScreenState();
}

class _PatronHomeScreenState extends State<PatronHomeScreen> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mes tâches",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      drawer: const MyDrawer(),
      body: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        header: ClassicHeader(),
        onRefresh: () async {
          Globals.profile = await getUserWS();
          setState(() {});
          refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
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
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 42.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              '${Globals.profile.firstName} ${Globals.profile.lastName}',
                              maxLines: 1,
                              style: MyTextStyles.headline,
                            ),
                            Text(
                              '${Globals.profile.getRole().name}',
                              style: MyTextStyles.body,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Globals.profile.getColleguesPlanningsToday().length != 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount:
                            Globals.profile.getColleguesPlanningsToday().length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PatronTacheExpansionTile(
                              index: index,
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Column(
                        children: [
                          Image.asset("assets/images/no_data.png"),
                          Text(
                            "Repos pour toute l'équipe aujourd'hui",
                            style: MyTextStyles.subhead
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
