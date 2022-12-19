import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/models/task.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/tache/add_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../services/tasks_api.dart';
import '../../../../utils/utils.dart';
import '../haccp/pop_up_widget.dart';

class EmployeTacheWidget extends StatefulWidget {
  final Task task;
  EmployeTacheWidget({
    Key? key,
    required this.task,
    required this.reloadParentCallback,
  }) : super(key: key);
  final VoidCallback reloadParentCallback;
  @override
  State<EmployeTacheWidget> createState() => _EmployeTacheWidgetState();
}

class _EmployeTacheWidgetState extends State<EmployeTacheWidget> {
  TextEditingController msg = TextEditingController();
  TextEditingController tache = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 55.w,
              child: AutoSizeText(
                "${widget.task.name}",
                maxLines: 2,
                style: MyTextStyles.headline,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 6.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () {
                        msg.text = widget.task.comment ?? '';
                        showDialog(
                          context: context,
                          builder: (_) => PopUpWidget(
                            controller: msg,
                            title: msg.text.isNotEmpty ? "Modifier un commentaire" : "Ajouter un commentaire",
                            function: (startLoading, stopLoading, btnState) {
                              if (msg.text != '') {
                                startLoading();
                                updateTaskWS(
                                  id: widget.task.id,
                                  collegueID: widget.task.professionalId,
                                  comment: msg.text,
                                  status: widget.task.status,
                                ).then((exceptionOrMessage) {
                                  stopLoading();
                                  exceptionOrMessage.fold(
                                    (exception) {
                                      Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                    },
                                    (message) {
                                      msg.clear();
                                      setState(() {});
                                      Utils.showCustomTopSnackBar(context, success: true, message: message);
                                      Navigator.pop(context, msg.text);
                                    },
                                  );
                                });
                              }
                            },
                          ),
                        ).then((value) {
                          widget.reloadParentCallback();
                        });
                      },
                      child: Image.asset("assets/commande_icons/msg.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // ArgonButton(
                //   height: 6.h,
                //   width: 10.w,
                //   minWidth: 10.w,
                //   color: MyColors.red,
                //   borderRadius: 15.0,
                //   roundLoadingShape: false,
                //   child: Center(
                //     child: Icon(
                //       Icons.camera_alt_outlined,
                //       color: Colors.white,
                //     ),
                //   ),
                //   loader: SpinKitRing(
                //     color: Colors.white,
                //     size: 40,
                //     lineWidth: 4,
                //   ),
                //   onTap: (startLoading, stopLoading, btnState) async {
                //     File? image = await pickImage();
                //     if (image != null) {
                //       startLoading();
                //       updateTaskWS(
                //         id: widget.task.id,
                //         collegueID: widget.task.professionalId,
                //         image: image,
                //       ).then((exceptionOrMessage) {
                //         stopLoading();
                //         exceptionOrMessage.fold(
                //           (exception) {
                //             Utils.showCustomTopSnackBar(context,
                //                 success: false, message: exception.toString());
                //           },
                //           (message) {
                //             setState(() {});
                //             Utils.showCustomTopSnackBar(context,
                //                 success: true, message: message);
                //           },
                //         );
                //       });
                //     }
                //   },
                // ),
                ArgonButton(
                  height: 6.h,
                  width: 10.w,
                  minWidth: 10.w,
                  color: MyColors.red,
                  borderRadius: 15.0,
                  roundLoadingShape: false,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  loader: SpinKitRing(
                    color: Colors.white,
                    size: 40,
                    lineWidth: 4,
                  ),
                  onTap: (startLoading, stopLoading, btnState) {
                    Utils.pushScreen(context, AddAssetPopUp(
                      fileCallback: (file, fileName) {
                        image = file;
                        fileName = fileName;
                        setState(() {});

                        print(image?.path);

                        if (image != null) {
                          startLoading();
                          updateTaskWS(
                            id: widget.task.id,
                            collegueID: widget.task.professionalId,
                            image: image,
                          ).then((exceptionOrMessage) {
                            stopLoading();
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
                    ), 0.3);
                  },
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        if (widget.task.comment != null && widget.task.imageUrl == null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.task.comment}',
                    style: MyTextStyles.body.copyWith(color: Colors.grey),
                  ),
                )),
          )
        else if (widget.task.comment == null && widget.task.imageUrl != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 15.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.task.imageUrl!,
                  ),
                ),
              ),
            ),
          )
        else if (widget.task.comment != null && widget.task.imageUrl != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.task.comment}',
                          style: MyTextStyles.body.copyWith(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 15.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.task.imageUrl!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
