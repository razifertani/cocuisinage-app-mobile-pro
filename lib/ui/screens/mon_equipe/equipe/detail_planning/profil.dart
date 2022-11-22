import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';

import 'package:cocuisinage_app_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class DetailPlanningProfileScreen extends StatefulWidget {
  int collegueID;
  DetailPlanningProfileScreen({Key? key, required this.collegueID})
      : super(key: key);

  @override
  State<DetailPlanningProfileScreen> createState() =>
      _DetailPlanningProfileScreenState();
}

class _DetailPlanningProfileScreenState
    extends State<DetailPlanningProfileScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController tlph = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confPassword = TextEditingController();
  @override
  void initState() {
    super.initState();

    nom.text = Globals.profile.getColleague(id: widget.collegueID).firstName;
    prenom.text = Globals.profile.getColleague(id: widget.collegueID).lastName;
    tlph.text =
        Globals.profile.getColleague(id: widget.collegueID).phoneNumber ?? '';
    email.text = Globals.profile.getColleague(id: widget.collegueID).email;
    password.text = '';
    newPassword.text = '';
  }

  bool isVisible = false;

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Détails du profil",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Form(
          key: key,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 7.h,
                            backgroundImage: image == null
                                ? NetworkImage(Globals.profile
                                    .getColleague(id: widget.collegueID)
                                    .imageUrl)
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
                              child: Icon(
                                Icons.edit_outlined,
                                size: 20,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor ==
                                            Colors.black
                                        ? Colors.black
                                        : null,
                              ),
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
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomCardTextForm(
                    controller: nom,
                    hintText: Globals.profile
                        .getColleague(id: widget.collegueID)
                        .firstName,
                    validator: (String? value) {
                      if (value!.length == 0) {
                        return 'Nom est requis !';
                      }
                      if (value.length < 4) {
                        return 'Nom n\'est pas valide !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCardTextForm(
                    controller: prenom,
                    hintText: Globals.profile
                        .getColleague(id: widget.collegueID)
                        .lastName,
                    validator: (String? value) {
                      if (value!.length == 0) {
                        return 'Prénom est requis !';
                      }
                      if (value.length < 4) {
                        return 'Prénom n\'est pas valide !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCardTextForm(
                    controller: tlph,
                    hintText: Globals.profile
                            .getColleague(id: widget.collegueID)
                            .phoneNumber ??
                        "01.02.03.04.05",
                    validator: (String? value) {
                      // if (value!.isNotEmpty /* && !Utils.mobileRegExp.hasMatch(value) */) {
                      //   return 'Numéro de téléphone n\'est pas valide !';
                      // }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCardTextForm(
                    controller: email,
                    hintText: Globals.profile
                        .getColleague(id: widget.collegueID)
                        .email,
                    validator: (String? value) {
                      if (value!.length == 0) {
                        return 'Email est requis !';
                      }
                      if (!Utils.emailRegExp.hasMatch(value)) {
                        return 'Email n\'est pas valide !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // CustomCardTextForm(
                  //   hintText: Globals.profile.getColleagueRid:ole(widget.collegueID).name,
                  //   disabled: true,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCardTextForm(
                    controller: password,
                    hintText: "Mot de passe actuel",
                    obscureText: !isVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor !=
                                Colors.black
                            ? Colors.black
                            : Colors.white,
                      ),
                      onPressed: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty && value.length < 4) {
                        return 'Mot de passe n\'est pas valide !';
                      }
                      if (value.isNotEmpty && newPassword.text.length == 0) {
                        return 'Veuillez écrire le nouveau mot de passe !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCardTextForm(
                    controller: newPassword,
                    hintText: "Nouveau mot de passe",
                    obscureText: !isVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor !=
                                Colors.black
                            ? Colors.black
                            : Colors.white,
                      ),
                      onPressed: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty && value.length < 4) {
                        return 'Mot de passe n\'est pas valide !';
                      }
                      if (value.isNotEmpty && password.text.length == 0) {
                        return 'Veuillez écrire le mot de passe actuel !';
                      }
                      if (value.isNotEmpty && confPassword.text.length == 0) {
                        return 'Veuillez réécrire le nouveau mot de passe !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomCardTextForm(
                    controller: confPassword,
                    hintText: "Confirmer le mot de passe",
                    obscureText: !isVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor !=
                                Colors.black
                            ? Colors.black
                            : Colors.white,
                      ),
                      onPressed: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                    ),
                    validator: (String? value) {
                      if (value!.isNotEmpty && value != newPassword.text) {
                        return 'Mots de passe ne correspondent pas !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    txt: "Modifier",
                    fun: (startLoading, stopLoading, btnState) {
                      if (btnState == ButtonState.Idle) {
                        if (key.currentState!.validate()) {
                          startLoading();
                          updateProfileWS(
                            professionalID: widget.collegueID,
                            firstName: nom.text,
                            lastName: prenom.text,
                            phoneNumber: tlph.text,
                            email: email.text,
                            password:
                                password.text.isNotEmpty ? password.text : null,
                            newPassword: newPassword.text.isNotEmpty
                                ? newPassword.text
                                : null,
                            image: image,
                          ).then((exceptionOrMessage) {
                            stopLoading();
                            exceptionOrMessage.fold(
                              (exception) {
                                Utils.showCustomTopSnackBar(context,
                                    success: false,
                                    message: exception.toString());
                              },
                              (message) {
                                password.clear();
                                newPassword.clear();
                                confPassword.clear();

                                setState(() {});
                                Utils.showCustomTopSnackBar(context,
                                    success: true, message: message);
                              },
                            );
                          });
                        }
                      }
                    },
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
