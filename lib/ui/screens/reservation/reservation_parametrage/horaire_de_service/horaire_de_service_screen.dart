import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_parametrage/horaire_de_service/horaire_de_service_showmodel.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mon_equipe/equipe/detail_planning/horaire_de_travail_autre_employe.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mon_equipe/equipe/detail_planning/profil.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../Theme/my_colors.dart';
import '../../../../../../Theme/my_text_styles.dart';

class HoraireDeServiceScreen extends StatefulWidget {
  HoraireDeServiceScreen({Key? key}) : super(key: key);

  @override
  State<HoraireDeServiceScreen> createState() => _HoraireDeServiceScreenState();
}

class _HoraireDeServiceScreenState extends State<HoraireDeServiceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // à changer
      _scrollController.jumpTo(currentMonthIndex * 70);
    });
  }

  var date = DateTime(2022, 1, 1);
  int currentMonthIndex = DateTime.now().month - 1;
  int weekdays = 7;
  int currentWeekIndex = (DateTime.now().day) ~/ 7;

  switchMonth(index) {
    currentMonthIndex = index;
    currentWeekIndex = 0;
    weekdays = 7;
    setState(() {});
  }

  switchWeek(index) {
    currentWeekIndex = index;
    weekdays = 7;
    setState(() {});
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Détails du planning",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Paramétrage d’horraire de service",
                style: MyTextStyles.headline,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 8.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: 12,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            switchMonth(index);

                            final contentSize =
                                (_scrollController.position.viewportDimension +
                                        _scrollController
                                            .position.maxScrollExtent) -
                                    index * 23;

                            final target = contentSize * currentMonthIndex / 12;
                            _scrollController.position.animateTo(
                              target,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SizedBox(
                            child: Text(
                              DateFormat.MMMM('fr').format(DateTime(
                                  date.year, date.month + index, date.day)),
                              style: MyTextStyles.cardTextStyle.copyWith(
                                color: currentMonthIndex == index
                                    ? MyColors.red
                                    : MyColors.grey.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      currentMonthIndex == 1 ? 4 : 5,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            switchWeek(index);
                          },
                          child: SizedBox(
                            height: 11.h,
                            width: 17.w,
                            child: Card(
                              color: currentWeekIndex == index
                                  ? MyColors.red
                                  : null,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Sem",
                                    style: currentWeekIndex == index
                                        ? MyTextStyles.headline
                                            .copyWith(color: Colors.white)
                                        : MyTextStyles.cardTextStyle.copyWith(
                                            color:
                                                MyColors.grey.withOpacity(0.8),
                                          ),
                                  ),
                                  Text(
                                    "${index + 1}",
                                    style: currentWeekIndex == index
                                        ? MyTextStyles.headline
                                            .copyWith(color: Colors.white)
                                        : MyTextStyles.cardTextStyle.copyWith(
                                            color:
                                                MyColors.grey.withOpacity(0.8),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(7, (index) {
                        final date = DateTime(
                            DateTime.now().year,
                            currentMonthIndex + 1,
                            (currentWeekIndex * 7) + index + 1);
                        if (date.month != currentMonthIndex + 1) {
                          weekdays--;
                          return const SizedBox();
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 6.5.h,
                            child: Text(
                              DateFormat.EEEE('fr').format(date) + " :",
                              style: MyTextStyles.headline,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  Column(
                    children: [
                      ...List.generate(7, (index) {
                        final dates = DateTime(
                            DateTime.now().year,
                            currentMonthIndex + 1,
                            (currentWeekIndex * 7) + index + 1);
                        if (dates.month != currentMonthIndex + 1) {
                          weekdays--;
                          return const SizedBox();
                        }

                        return Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 8.h.clamp(70, 110),
                            width: 50.w,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, i) {
                                  {
                                    return InkWell(
                                      onTap: () {
                                        print("object");
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              HoraireDeServiceShowModel(),
                                        );
                                      },
                                      child: Container(
                                        width: 45.w,
                                        child: Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: MyColors.red,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }));
                      }),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
