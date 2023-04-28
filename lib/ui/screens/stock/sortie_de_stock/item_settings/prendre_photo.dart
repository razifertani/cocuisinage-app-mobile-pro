import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/custom_button.dart';

class SortieDeStockPrendrePhoto extends StatefulWidget {
  const SortieDeStockPrendrePhoto({Key? key}) : super(key: key);

  @override
  State<SortieDeStockPrendrePhoto> createState() =>
      _SortieDeStockPrendrePhotoState();
}

class _SortieDeStockPrendrePhotoState extends State<SortieDeStockPrendrePhoto> {
  int currentIndex = 0;
  switchTab(int value) {
    currentIndex = value;
    setState(() {});
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Ajouter tracabilité",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Prendre une photo de l’étiquette",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () => pickImage(),
                child: Container(
                    height: 7.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: MyColors.red,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Photo",
                          style: MyTextStyles.headline
                              .copyWith(color: Colors.white),
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            image != null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 20.h,
                          width: 80.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              image!,
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                  )
                : const SizedBox(),
            const Spacer(),
            CustomButton(txt: "Valider", fun: (a, b, c) {}),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
