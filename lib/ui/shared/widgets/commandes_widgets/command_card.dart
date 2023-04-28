import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommandCard extends StatelessWidget {
  final CommandStatus commandStatus;
  const CommandCard({
    Key? key,
    required this.commandStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A domicile",
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Nb produits : 12",
                  style:
                      MyTextStyles.subhead.copyWith(color: Color(0xff909090)),
                ),
              ],
            ),
            Container(
              width: 30.w,
              height: 45,
              decoration: BoxDecoration(
                  color: commandBackgroundColor(),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                commandText(),
                style:
                    MyTextStyles.subhead.copyWith(color: commandStatusColor()),
              )),
            )
          ],
        ),
      ),
    );
  }

  String commandText() {
    switch (commandStatus) {
      case CommandStatus.annule:
        return "Annulé";
      case CommandStatus.attente:
        return "En attente";
      case CommandStatus.confirme:
      default:
        return "Confirmé";
    }
  }

  Color commandStatusColor() {
    switch (commandStatus) {
      case CommandStatus.annule:
        return Color(0xffD43347);
      case CommandStatus.attente:
        return Color(0xffF9A413);
      case CommandStatus.confirme:
      default:
        return Color(0xff2E9C61);
    }
  }

  commandBackgroundColor() {
    switch (commandStatus) {
      case CommandStatus.annule:
        return Color(0xffFBD7DB);
      case CommandStatus.attente:
        return Color(0xffFFE6BA);
      case CommandStatus.confirme:
      default:
        return Color(0xffD2F3DC);
    }
  }
}
