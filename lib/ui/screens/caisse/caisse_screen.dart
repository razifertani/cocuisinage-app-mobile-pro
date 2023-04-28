import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/caisse/caisse_tickets_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/plan_de_table/plan_de_table.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/plan_de_table/plan_de_table_externe.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/caisse_widgets/caisse_stat_card.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/caisse_widgets/periode_de_vente_show_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import 'cloture_de_caisse/cloture_de_caisse_screen.dart';

class CaisseScreen extends StatefulWidget {
  const CaisseScreen({Key? key}) : super(key: key);

  @override
  State<CaisseScreen> createState() => _CaisseScreenState();
}

class _CaisseScreenState extends State<CaisseScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 1),
        () => showDialog(
              context: context,
              builder: (_) => PeriodeDeVenteShowModel(),
            ));
    super.initState();
  }

  int currentIndex = 0;
  void switchIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ma caisse",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ma caisse",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PlanDeTableScreenExterne()));
                      },
                      child: CaisseStatCard(
                          title: "Plan de table", content: "25")),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClotureDeCaisseScreen()));
                      },
                      child: CaisseStatCard(
                          title: "Cloture de caisse", content: "25"))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Bienvenu ! Choissez un utilisateur actif ",
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.w > 600 ? 300 : 200,
                childAspectRatio: 1.1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  switchIndex(index);
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color: currentIndex == index
                                ? MyColors.red
                                : Colors.white)),
                    elevation: 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: MyColors.red,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(
                                "https://nationaltoday.com/wp-content/uploads/2021/07/shutterstock_1518533924-min.jpg",
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: AutoSizeText(
                            "Nom prénom",
                            style: MyTextStyles.subhead,
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: AutoSizeText(
                            "Chef de cuisine",
                            maxLines: 1,
                            style:
                                MyTextStyles.body.copyWith(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: CustomButton(
                    txt: "Suivant",
                    fun: (a, b, c) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CaisseTicketsScreen()),
                      );
                    })),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
