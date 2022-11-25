import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/custom_button.dart';
import '../../shared/widgets/custom_card_text_form.dart';

class SignalerUnBugScreen extends StatefulWidget {
  const SignalerUnBugScreen({Key? key}) : super(key: key);

  @override
  State<SignalerUnBugScreen> createState() => _SignalerUnBugScreenState();
}

class _SignalerUnBugScreenState extends State<SignalerUnBugScreen> {
  String dropdownvaluecateg = 'Service';

  var categories = [
    'Service',
    'Mes taches',
  ];
  TextEditingController detail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Signaler un bug",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: MyColors.red,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Aidez-nous à améliorer !",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      value: dropdownvaluecateg,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: categories.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvaluecateg = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Détails",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardTextForm(
                  controller: detail,
                  hintText: "Ecriver votre message",
                  minLines: 10,
                  maxLines: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomButton(
                      txt: "Envoyer",
                      fun: (a, b, c) {
                        // showDialog(
                        //     context: context,
                        //     builder: (_) => SuccessShowmodel(
                        //           description: "Commentaire envoyée",
                        //         ));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
