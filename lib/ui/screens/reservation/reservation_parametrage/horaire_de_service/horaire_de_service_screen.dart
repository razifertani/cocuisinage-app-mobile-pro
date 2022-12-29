import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_parametrage/horaire_de_service/horaire_de_service_showmodel.dart';
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
  var date = DateTime(2022, 1, 1);

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
                        final date = DateTime(DateTime.now().year, 1, 1 + index + 1);

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
                      ...List.generate(
                        7,
                        (index) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 8.h.clamp(70, 110),
                            width: 50.w,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (context, i) {
                                {
                                  if (i == 0) {
                                    return InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => HoraireDeServiceShowModel(
                                              dayOfWeek: index + 1,
                                              part: 1,
                                              start: (Globals.profile.getEstablishment().schedules[index].begin == null) ? TimeOfDay(hour: 7, minute: 00) : TimeOfDay(hour: Globals.profile.getEstablishment().schedules[index].begin!.hour, minute: Globals.profile.getEstablishment().schedules[index].begin!.minute),
                                              end: (Globals.profile.getEstablishment().schedules[index].ending == null) ? TimeOfDay(hour: 12, minute: 00) : TimeOfDay(hour: Globals.profile.getEstablishment().schedules[index].ending!.hour, minute: Globals.profile.getEstablishment().schedules[index].ending!.minute)),
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Container(
                                        width: 45.w,
                                        child: Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Center(
                                              child: (Globals.profile.getEstablishment().schedules[index].begin == null || Globals.profile.getEstablishment().schedules[index].ending == null)
                                                  ? Icon(
                                                      Icons.add,
                                                      color: MyColors.red,
                                                      size: 30,
                                                    )
                                                  : AutoSizeText.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '${DateFormat.Hm().format(Globals.profile.getEstablishment().schedules[index].begin!)}',
                                                            style: MyTextStyles.cardTextStyle,
                                                          ),
                                                          TextSpan(
                                                            text: ' - ',
                                                            style: MyTextStyles.cardTextStyle,
                                                          ),
                                                          TextSpan(
                                                            text: '${DateFormat.Hm().format(Globals.profile.getEstablishment().schedules[index].ending!)}',
                                                            style: MyTextStyles.cardTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => HoraireDeServiceShowModel(
                                              dayOfWeek: index + 1,
                                              part: 2,
                                              start: (Globals.profile.getEstablishment().schedules[index].secondBegin == null) ? TimeOfDay(hour: 15, minute: 00) : TimeOfDay(hour: Globals.profile.getEstablishment().schedules[index].secondBegin!.hour, minute: Globals.profile.getEstablishment().schedules[index].secondBegin!.minute),
                                              end: (Globals.profile.getEstablishment().schedules[index].secondEnd == null) ? TimeOfDay(hour: 22, minute: 00) : TimeOfDay(hour: Globals.profile.getEstablishment().schedules[index].secondEnd!.hour, minute: Globals.profile.getEstablishment().schedules[index].secondEnd!.minute)),
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Container(
                                        width: 45.w,
                                        child: Card(
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Center(
                                              child: (Globals.profile.getEstablishment().schedules[index].secondBegin == null || Globals.profile.getEstablishment().schedules[index].secondEnd == null)
                                                  ? Icon(
                                                      Icons.add,
                                                      color: MyColors.red,
                                                      size: 30,
                                                    )
                                                  : AutoSizeText.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: '${DateFormat.Hm().format(Globals.profile.getEstablishment().schedules[index].secondBegin!)}',
                                                            style: MyTextStyles.cardTextStyle,
                                                          ),
                                                          TextSpan(
                                                            text: ' - ',
                                                            style: MyTextStyles.cardTextStyle,
                                                          ),
                                                          TextSpan(
                                                            text: '${DateFormat.Hm().format(Globals.profile.getEstablishment().schedules[index].secondEnd!)}',
                                                            style: MyTextStyles.cardTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          );
                        },
                      ),
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
