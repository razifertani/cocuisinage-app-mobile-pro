import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../custom_button.dart';
import '../../divider.dart';

class PopUpQrCode extends StatelessWidget {
  const PopUpQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const MyDivider(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "QR code",
            style: MyTextStyles.headline
                .copyWith(fontWeight: FontWeight.w600, color: MyColors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/qr_code.png"),
          const Spacer(),
          CustomButton(txt: "Imprimer", fun: (a, b, c) {}),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
