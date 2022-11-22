import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:flutter/material.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';

class ExporterMesDonnes extends StatelessWidget {
  String? appbarTitle;
  ExporterMesDonnes({Key? key, this.appbarTitle}) : super(key: key);
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            appbarTitle ?? "Exporter mes données",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "E-mail",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomCardTextForm(
                controller: email,
                hintText: "email",
                textInputType: TextInputType.emailAddress),
            const Spacer(),
            Center(
                child:
                    CustomButton(txt: "Partager un export", fun: (a, b, c) {})),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
