import 'dart:async';
import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro/services/estbalishments_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/mes_boutiques/mes_boutiques.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../utils/utils.dart';
import '../../../shared/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class ModifierBoutiqueScreen extends StatefulWidget {
  bool? pop;
  ModifierBoutiqueScreen({
    Key? key,
    this.pop,
  }) : super(key: key);

  @override
  State<ModifierBoutiqueScreen> createState() => _ModifierBoutiqueScreenState();
}

class _ModifierBoutiqueScreenState extends State<ModifierBoutiqueScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  EstablishmentsRoles establishmentsRoles = Globals.profile.establishmentsRoles.firstWhere((element) => element.id == Globals.params.currentEstablishmentID);

  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  // TextEditingController longitude = TextEditingController();
  // TextEditingController latitude = TextEditingController();

  @override
  void initState() {
    super.initState();

    name.text = establishmentsRoles.name;
    city.text = establishmentsRoles.city ?? '';
    // longitude.text = establishmentsRoles.longitude ?? '';
    // latitude.text = establishmentsRoles.latitude ?? '';
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
          "Modifier ma boutique",
          style: MyTextStyles.appBarTextStyle,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.question_mark))],
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).unfocus();
        }),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Nom de Boutique",
                    style: MyTextStyles.headline,
                  ),
                  CustomCardTextForm(
                    hintText: "nom",
                    controller: name,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Ville",
                    style: MyTextStyles.headline,
                  ),
                  CustomCardTextForm(
                    hintText: "Ville",
                    controller: city,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Image de boutique ',
                      style: MyTextStyles.headline,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: image == null ? Image.network(establishmentsRoles.imageUrl) : Image.file(image!),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "Longitude",
                  //   style: MyTextStyles.headline,
                  // ),
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  //   elevation: 5,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     child: TextFormField(
                  //       controller: longitude,
                  //       keyboardType: TextInputType.name,
                  //       decoration: const InputDecoration(
                  //         hintText: "Longitude",
                  //         border: InputBorder.none,
                  //         focusedBorder: InputBorder.none,
                  //         enabledBorder: InputBorder.none,
                  //         disabledBorder: InputBorder.none,
                  //       ),
                  //       validator: (String? value) {
                  //         if (value!.length < 1) {
                  //           return 'Vérifier la longitude de la boutique';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // Text(
                  //   "Latitude",
                  //   style: MyTextStyles.headline,
                  // ),
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  //   elevation: 5,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     child: TextFormField(
                  //       controller: latitude,
                  //       keyboardType: TextInputType.name,
                  //       decoration: const InputDecoration(
                  //         hintText: "Latitude",
                  //         border: InputBorder.none,
                  //         focusedBorder: InputBorder.none,
                  //         enabledBorder: InputBorder.none,
                  //         disabledBorder: InputBorder.none,
                  //       ),
                  //       validator: (String? value) {
                  //         if (value!.length < 1) {
                  //           return 'Vérifier la latitude de la boutique';
                  //         }
                  //         return null;
                  //       },
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Opacity(
                      //changer l'opacity
                      opacity: 1,
                      child: CustomButton(
                        txt: "Modifier",
                        fun: (startLoading, stopLoading, btnState) {
                          if (btnState == ButtonState.Idle) {
                            if (key.currentState!.validate()) {
                              startLoading();
                              updateEstablishmentWS(
                                establishmentID: Globals.params.currentEstablishmentID!,
                                name: name.text,
                                city: city.text,
                                // longitude: longitude.text,
                                // latitude: latitude.text,
                                image: image != null ? image : null,
                              ).then(
                                (exceptionOrMessage) {
                                  stopLoading();
                                  exceptionOrMessage.fold(
                                    (exception) {
                                      Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                    },
                                    (message) {
                                      setState(() {});
                                      Utils.showCustomTopSnackBar(context, success: true, message: message);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MesBoutiquesScreen(),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
