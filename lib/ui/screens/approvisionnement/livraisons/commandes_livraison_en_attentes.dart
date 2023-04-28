import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/widgets/livraison_widgets/commandes_livraison_card.dart';
import '../../../shared/widgets/planning_widgets/horizontal_calendar.dart';

class CommandesLivraisonEnAttentes extends StatelessWidget {
  const CommandesLivraisonEnAttentes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 6),
        //   child: SizedBox(
        //     height: 22.h,
        //     child: GridView.count(
        //         shrinkWrap: true,
        //         scrollDirection: Axis.horizontal,
        //         crossAxisCount: 1,
        //         childAspectRatio: 0.8,
        //         mainAxisSpacing: 1.5.h,
        //         crossAxisSpacing: 1.5.h,
        //         children: [
        //           GestureDetector(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => const HistoDeDepense()),
        //                 );
        //               },
        //               child: CommonStatCard(
        //                   title: "Dépenses", content: "32", stat: false)),
        //           GestureDetector(
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const BoutiqueScreen()),
        //               );
        //             },
        //             child: CommonStatCard(
        //                 title: "Produits", content: "510€", stat: false),
        //           ),
        //           GestureDetector(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => const BoutiqueScreen()),
        //                 );
        //               },
        //               child: CommonStatCard(
        //                   title: "Plats", content: "12", stat: false)),
        //         ]),
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
        const HorizontalCalendar(),
        const SizedBox(
          height: 20,
        ),
        CommandesLivraisonCard()
      ],
    );
  }
}
