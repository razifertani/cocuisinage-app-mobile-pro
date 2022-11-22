import 'dart:async';
import 'dart:io';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/estbalishments_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/permissions_service.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/mes_boutiques/mes_boutiques.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/boutique/creer_boutique/ajouter_adresse.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class CreerBoutiqueDetail extends StatefulWidget {
  CreerBoutiqueDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<CreerBoutiqueDetail> createState() => _CreerBoutiqueDetailState();
}

final glabelkey = GlobalKey<FormState>();

class _CreerBoutiqueDetailState extends State<CreerBoutiqueDetail> {
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Créer ma boutique",
          style: MyTextStyles.appBarTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // showDialog(
              //   context: context,
              //   builder: (_) => TutorielPopUp(
              //     numberOfPages: 1,
              //     title: "Ma boutique",
              //     description: "Ajout des informations essentielles de votre boutique : dénomination sociale, adresse postale, téléphone,  image de votre boutique, horaires d’ouverture.",
              //   ),
              // );
            },
            icon: Icon(
              Icons.question_mark,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).unfocus();
        }),
        child: SingleChildScrollView(
          child: Form(
            key: glabelkey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 7.h,
                            backgroundImage: image == null
                                ? null
                                : FileImage(image!) as ImageProvider,
                            child: Material(
                              shape: const CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 1,
                          child: GestureDetector(
                            onTap: () => pickImage(),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.edit_outlined,
                                  size: 20,
                                  color: Theme.of(context)
                                              .scaffoldBackgroundColor ==
                                          Colors.black
                                      ? Colors.black
                                      : null),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (image == null) {
                        return 'Vérifier l\'image de la boutique';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Nom de la boutique",
                    style: MyTextStyles.headline,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          hintText: "Nom",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (String? value) {
                          if (value!.length < 3) {
                            return 'Vérifier le nom de la boutique';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Ville",
                    style: MyTextStyles.headline,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: city,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: "Ville",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        validator: (String? value) {
                          if (value!.length < 3) {
                            return 'Vérifier le nom de la ville';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Center(
                  //   child: CustomButton(
                  //       txt: "Ajouter une adresse",
                  //       fun: (startLoading, stopLoading, btnState) {
                  //         Utils.pushScreen(context, const AjouterAdresse(), 0.7);
                  //       }),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomButton(
                      txt: "Ajouter",
                      fun: (startLoading, stopLoading, btnState) async {
                        if (btnState == ButtonState.Idle) {
                          if (glabelkey.currentState!.validate() &&
                              image != null) {
                            startLoading();

                            await PermissionsService.configure();
                            Position position =
                                await Geolocator.getCurrentPosition(
                              forceAndroidLocationManager: false,
                              desiredAccuracy: LocationAccuracy.best,
                            );

                            addEstablishmentWS(
                              name: name.text,
                              city: city.text,
                              longitude: position.longitude.toString(),
                              latitude: position.latitude.toString(),
                              image: image!,
                            ).then(
                              (exceptionOrMessage) {
                                stopLoading();
                                exceptionOrMessage.fold(
                                  (exception) {
                                    Utils.showCustomTopSnackBar(context,
                                        success: false,
                                        message: exception.toString());
                                  },
                                  (message) {
                                    setState(() {});
                                    Utils.showCustomTopSnackBar(context,
                                        success: true, message: message);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MesBoutiquesScreen(),
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
