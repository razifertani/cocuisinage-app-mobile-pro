import 'package:cocuisinage_app_mobile_pro/services/professional_api.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class NotificationSettingsScreen extends StatefulWidget {
  NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paramétres de notifications",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: Globals.profile.getNotificationsParamsForEstablishment().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SizedBox(
                      width: 95.w,
                      child: SwitchListTile(
                        title: Text(
                          'Autoriser les notifications de ${Globals.profile.getNotificationsParamsForEstablishment()[index].name}',
                          style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
                        ),
                        value: Globals.profile.getNotificationsParamsForEstablishment()[index].pivot.active,
                        activeColor: MyColors.red,
                        onChanged: (bool value) {
                          toggleNotificationTypeActiveParamWS(
                            notificationTypeID: Globals.profile.getNotificationsParamsForEstablishment()[index].pivot.notificationTypeId,
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
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
