import 'dart:io';
import 'dart:typed_data';

import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../custom_button.dart';
import '../../divider.dart';

class PopUpQrCode extends StatefulWidget {
  final int tableID;
  const PopUpQrCode({Key? key, required this.tableID}) : super(key: key);

  @override
  State<PopUpQrCode> createState() => _PopUpQrCodeState();
}

class _PopUpQrCodeState extends State<PopUpQrCode> {
  Uint8List? imageFile;
  ScreenshotController screenshotController = ScreenshotController();

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
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600, color: MyColors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          Screenshot(
            controller: screenshotController,
            child: QrImage(
              data: "https://www.cocuisinage.fr/boutique/" + Globals.params.currentEstablishmentID.toString() + "/plats?table_id=" + widget.tableID.toString(),
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          const Spacer(),
          CustomButton(
              txt: "Imprimer",
              fun: (startLoading, stopLoading, btnState) async {
                screenshotController.capture().then((Uint8List? image) async {
                  if (image != null) {
                    imageFile = image;
                    final directory = await getApplicationDocumentsDirectory();
                    final imagePath = await File('${directory.path}/screenshot.jpg').create();
                    await imagePath.writeAsBytes(image);

                    Share.shareXFiles([XFile('${directory.path}/screenshot.jpg')], text: 'Screenshot');
                  }
                });
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
