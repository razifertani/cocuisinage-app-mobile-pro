import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/estbalishments_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class DureeDeServiceScreen extends StatefulWidget {
  DureeDeServiceScreen({Key? key}) : super(key: key);

  @override
  State<DureeDeServiceScreen> createState() => _DureeDeServiceScreenState();
}

class _DureeDeServiceScreenState extends State<DureeDeServiceScreen> {
  final List<int> times = [30, 45, 60, 75];
  int currentDuration = Globals.profile.getEstablishment().bookingDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Durée de réservation",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Tranche horaire",
              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                ...List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentDuration = times[index];
                        });

                        updateEstablishmentBookingDurationWS(
                          establishmentID: Globals.profile.getEstablishment().id,
                          bookingDuration: times[index],
                        ).then((exceptionOrMessage) {
                          exceptionOrMessage.fold(
                            (exception) {
                              setState(() {});
                              Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                            },
                            (message) {
                              setState(() {});
                              Utils.showCustomTopSnackBar(context, success: true, message: message);
                            },
                          );
                        });
                      },
                      child: Card(
                        elevation: 3,
                        color: currentDuration == times[index] ? MyColors.red : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          child: Text('${times[index]} min', style: MyTextStyles.subhead.copyWith(color: currentDuration == times[index] ? Colors.white : Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
