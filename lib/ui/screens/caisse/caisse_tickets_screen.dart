import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/caisse/caisse_ajouter_ticket.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/caisse/caisse_calcul.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/preparation_de_commande/prep_commande.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/widgets/caisse_widgets/caisse_stat_card.dart';

class CaisseTicketsScreen extends StatefulWidget {
  const CaisseTicketsScreen({Key? key}) : super(key: key);

  @override
  State<CaisseTicketsScreen> createState() => _CaisseTicketsScreenState();
}

class _CaisseTicketsScreenState extends State<CaisseTicketsScreen> {
  int tickes = 0;
  double opacity = 0.5;
  int? selectedTicket;
  void changeIndex(int index) {
    selectedTicket = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CaisseAjouterTicketScreen(
                      callBack: () {
                        tickes += 1;
                        print(tickes);
                        setState(() {});
                      },
                    )),
          );
        },
        child: Icon(
          Icons.add,
          color: MyColors.red,
          size: 28,
        ),
      ),
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
                  CaisseStatCard(title: "Plan de table", content: "25"),
                  CaisseStatCard(title: "Cloture de caisse", content: "25")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tickets",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            tickes == 0
                ? Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/box.png",
                          height: 200,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Aucune ticket est en cours!\nCréer en une",
                          textAlign: TextAlign.center,
                          style: MyTextStyles.subhead,
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      ...List.generate(
                          tickes,
                          (index) => Center(
                                child: SizedBox(
                                  height: 8.h,
                                  width: 90.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CaisseCalculator(),
                                          ));
                                    },
                                    onLongPress: () {
                                      changeIndex(index);
                                      opacity = 1;
                                    },
                                    child: Card(
                                      color: selectedTicket == index
                                          ? MyColors.red
                                          : null,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Ticket ${index + 1}",
                                              style: MyTextStyles.subhead
                                                  .copyWith(
                                                      color: selectedTicket ==
                                                              index
                                                          ? Colors.white
                                                          : null),
                                            ),
                                            Icon(Icons.arrow_forward_ios,
                                                size: 18,
                                                color: selectedTicket == index
                                                    ? Colors.white
                                                    : null)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                    ],
                  ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Opacity(
                  opacity: opacity,
                  child: CustomButton(
                      txt: 'Envoyer au cuisine',
                      fun: (a, b, c) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             PreparationDeCommandeScreen()));
                      })),
            )
          ],
        ),
      ),
    );
  }
}
