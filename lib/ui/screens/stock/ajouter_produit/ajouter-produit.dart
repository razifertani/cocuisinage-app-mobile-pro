import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

import '../../../shared/custom_button.dart';
import '../../../shared/widgets/custom_card_text_form.dart';
import '../../../shared/widgets/time_picker/pick_date.dart';

class AjouterProduitSortieDeStock extends StatefulWidget {
  const AjouterProduitSortieDeStock({Key? key}) : super(key: key);

  @override
  State<AjouterProduitSortieDeStock> createState() =>
      _AjouterProduitSortieDeStockState();
}

class _AjouterProduitSortieDeStockState
    extends State<AjouterProduitSortieDeStock> {
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

  final _formKey = GlobalKey<FormState>();
  TextEditingController nom = TextEditingController();
  TextEditingController descrip = TextEditingController();
  TextEditingController origine = TextEditingController();
  TextEditingController variete = TextEditingController();
  TextEditingController prixAchat = TextEditingController();
  TextEditingController prixFournis = TextEditingController();
  TextEditingController date = TextEditingController();

  String dropdownvaluefournis = 'Fournisseur 1';

  var fournisseurs = [
    'Fournisseur 1',
    'Fournisseur 2',
    'Fournisseur 3',
    'Fournisseur 4',
    'Fournisseur 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Ajouter un produit",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).unfocus();
        }),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Renseigner les informations du produit :',
                      style: MyTextStyles.headline,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomCardTextForm(
                    controller: nom,
                    hintText: "Nom",
                  ),
                  SizedBox(
                    height: 2.h,
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
                    controller: prixAchat,
                    hintText: "Prix achat",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton(
                          underline: SizedBox(),
                          // Initial Value
                          value: dropdownvaluefournis,
                          elevation: 3,
                          isExpanded: true,

                          icon: const Icon(Icons.keyboard_arrow_down),

                          items: fournisseurs.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvaluefournis = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomCardTextForm(
                    controller: prixFournis,
                    hintText: "Prix fournisseur",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  PickDate(
                    initialDate: DateTime.now(),
                    ondateChanged: (date) {},
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
                                ? Image.asset(
                                    "assets/images/ajouter-une-photo.png")
                                : Image.file(image!))),
                  ),
                  Text(
                    "Formats accepté : \nPNG ou JPG",
                    style: MyTextStyles.body,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                      child: CustomButton(
                          txt: "Valider",
                          fun: (a, b, c) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => EtapesScreen()),
                            // );
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
