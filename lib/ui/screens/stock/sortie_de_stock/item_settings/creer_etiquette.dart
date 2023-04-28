import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/widgets/custom_card_text_form.dart';
import '../../../../shared/widgets/time_picker/pick_date.dart';

class CreerEtiquetteSortieDeStock extends StatefulWidget {
  bool? isPlat;
  CreerEtiquetteSortieDeStock({Key? key, this.isPlat}) : super(key: key);

  @override
  State<CreerEtiquetteSortieDeStock> createState() =>
      _CreerEtiquetteSortieDeStockState();
}

class _CreerEtiquetteSortieDeStockState
    extends State<CreerEtiquetteSortieDeStock> {
  int currentIndex = 0;

  switchButton(int value) {
    currentIndex = value;

    setState(() {});
  }

  TextEditingController heure = TextEditingController();

  TextEditingController qte = TextEditingController();
  TextEditingController dlc = TextEditingController();
  TextEditingController lot = TextEditingController();
  String dropdownvaluecateg = 'g';

  var categories = [
    'g',
    'kg',
    'ml',
    'l',
  ];
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
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
              title: Text(
                "Produit",
                style: MyTextStyles.appBarTextStyle,
              ),
              centerTitle: true,
              backgroundColor: MyColors.red,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context))),
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
                    "24 aout 12:00  ",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "DLC",
                    style: MyTextStyles.headline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PickDate(
                    initialDate: DateTime.now(),
                    ondateChanged: (date) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "N° de lot",
                    style: MyTextStyles.headline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomCardTextForm(controller: lot, hintText: "1"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Service",
                    style: MyTextStyles.headline,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          switchButton(0);
                        },
                        child: SizedBox(
                          height: 12.h,
                          width: 22.w,
                          child: Card(
                            color:
                                currentIndex == 0 ? MyColors.red : Colors.white,
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/haccp_icons/matin.png"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "matin",
                                    style: MyTextStyles.body.copyWith(
                                      color: currentIndex != 0
                                          ? MyColors.red
                                          : Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          switchButton(1);
                        },
                        child: SizedBox(
                          height: 12.h,
                          width: 22.w,
                          child: Card(
                            color:
                                currentIndex == 1 ? MyColors.red : Colors.white,
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/haccp_icons/soleil.png"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "midi",
                                    style: MyTextStyles.body.copyWith(
                                      color: currentIndex != 1
                                          ? MyColors.red
                                          : Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          switchButton(2);
                        },
                        child: SizedBox(
                          height: 12.h,
                          width: 22.w,
                          child: Card(
                            color:
                                currentIndex == 2 ? MyColors.red : Colors.white,
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset("assets/haccp_icons/soir.png"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "soir",
                                    style: MyTextStyles.body.copyWith(
                                      color: currentIndex != 2
                                          ? MyColors.red
                                          : Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          switchButton(3);
                        },
                        child: SizedBox(
                          height: 12.h,
                          width: 22.w,
                          child: Card(
                            color:
                                currentIndex == 3 ? MyColors.red : Colors.white,
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                      "assets/haccp_icons/baguette-magique.png"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      "Indifferent",
                                      style: MyTextStyles.body.copyWith(
                                        color: currentIndex != 3
                                            ? MyColors.red
                                            : Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nombre de portions",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nombre de produit",
                    style: MyTextStyles.subhead,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.remove,
                              color: MyColors.red,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          width: 14.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(child: Text("1")),
                        ),
                      ),
                      GestureDetector(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: MyColors.red,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  widget.isPlat ?? false
                      ? Row(
                          children: [
                            SizedBox(
                                width: 60.w,
                                child: CustomCardTextForm(
                                    controller: qte, hintText: "Quantité")),
                            SizedBox(
                              width: 20.w,
                              child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
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
                            ),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Prendre une photo de l’étiquette",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nombre d’étiquette",
                    style: MyTextStyles.subhead,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.remove,
                              color: MyColors.red,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          width: 14.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(child: Text("1")),
                        ),
                      ),
                      GestureDetector(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: MyColors.red,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: CustomButton(txt: "Imprimer", fun: (a, b, c) {})),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
