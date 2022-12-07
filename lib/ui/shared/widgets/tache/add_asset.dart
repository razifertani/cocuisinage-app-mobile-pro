import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:camera/camera.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/services/plannings_api.dart';
import 'package:cocuisinage_app_mobile_pro/services/tasks_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../Theme/my_colors.dart';
import 'camera_page.dart';

class AddAssetPopUp extends StatefulWidget {
  AddAssetPopUp({
    Key? key,
  }) : super(key: key);

  @override
  State<AddAssetPopUp> createState() => _AddAssetPopUpState();
}

class _AddAssetPopUpState extends State<AddAssetPopUp> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  String fileName = "";

  Future<FilePickerResult?> _openFilePicker() async {
    return await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                if (image != null) {
                  updateTaskWS(
                    id: 21,
                    collegueID: 2,
                    image: image,
                  ).then((exceptionOrMessage) {
                    exceptionOrMessage.fold(
                      (exception) {
                        Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                      },
                      (message) {
                        setState(() {});
                        Utils.showCustomTopSnackBar(context, success: true, message: message);
                      },
                    );
                  });
                }
              },
              child: Container(child: Text('Aa'))),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              availableCameras()
                  .then((value) async => await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CameraPage(
                                cameras: value,
                              ))))
                  .then((value) {
                if (value != null) {}
              });
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: MyColors.red,
                      ),
                    ),
                    Text(
                      "Ouvrir caméra",
                      style: MyTextStyles.subhead,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              pickImage();
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.photo,
                        color: MyColors.red,
                      ),
                    ),
                    Text(
                      "Ouvrir galerie",
                      style: MyTextStyles.subhead,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              _openFilePicker().then((value) {
                if (value != null && value.files.first.path != null) {
                  image = File(value.files.first.path!);
                  setState(() {});
                }
              });
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.file_open,
                        color: MyColors.red,
                      ),
                    ),
                    Text(
                      "Joindre un fichier",
                      style: MyTextStyles.subhead,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
