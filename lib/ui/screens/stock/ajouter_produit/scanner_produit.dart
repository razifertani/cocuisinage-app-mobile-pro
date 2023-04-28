import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class ScannerProduitStock extends StatefulWidget {
  bool? isBoutique;
  ScannerProduitStock({Key? key, this.isBoutique}) : super(key: key);

  @override
  State<ScannerProduitStock> createState() => _ScannerProduitStockState();
}

class _ScannerProduitStockState extends State<ScannerProduitStock> {
  TextEditingController origine = TextEditingController();
  TextEditingController variete = TextEditingController();
  TextEditingController descrip = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController qte = TextEditingController();

  String dropdownvaluecateg = 'Categorie 1';

  var categories = [
    'Categorie 1',
    'Categorie 2',
    'Categorie 3',
    'Categorie 4',
    'Categorie 5',
  ];

  String quan = 'g';

  var qtes = [
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
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Salade de fruit",
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
            widget.isBoutique ?? false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ajouter une catégorie",
                        style: MyTextStyles.headline
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
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
                        height: 20,
                      ),
                    ],
                  )
                : SizedBox(),
            Text(
              "Salade de fruit",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                  radius: 100.w < 450 ? 14.w : 7.w,
                  backgroundImage: const NetworkImage(
                      "https://cdn.pratico-pratiques.com/app/uploads/sites/2/2018/08/29104341/salade-de-fruits.jpeg"),
                  child: Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(onTap: () {}))),
            ),
            Text(
              "Modifier",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 45.w,
                    child: CustomCardTextForm(
                      controller: variete,
                      hintText: "Variete",
                    )),
                SizedBox(
                    width: 45.w,
                    child: CustomCardTextForm(
                      controller: origine,
                      hintText: "Origine",
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomCardTextForm(
              controller: descrip,
              hintText: "Description du produit",
              minLines: 7,
              maxLines: 10,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomCardTextForm(
              controller: prix,
              hintText: "prix",
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        value: quan,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: qtes.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            quan = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ajouter image de produit',
                  style: MyTextStyles.headline,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: GestureDetector(
                      onTap: () => pickImage(),
                      child: image == null
                          ? Image.asset("assets/images/ajouter-une-photo.png")
                          : Image.file(image!))),
            ),
            Text(
              "Formats accepté : \nPNG ou JPG",
              style: MyTextStyles.body,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(fun: (a, b, c) {}, txt: "Valider"),
            )
          ],
        ),
      )),
    );
  }
}
