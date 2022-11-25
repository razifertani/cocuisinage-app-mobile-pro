import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/widgets/notification_widgets/notification_card.dart';
import '../drawer/drawer.dart';
import '../tutoriel/tutoriel_pop_up.dart';
import 'notification_settings/notification_settings.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        actions: [
          IconButton(
            onPressed: () {
              print(Globals.profile.notificationsAsReceiver.length);
              showDialog(
                  context: context,
                  builder: (_) => TutorielPopUp(
                      title: "Mes notifications",
                      description:
                          "vous recevrez en temps réel des notifications de votre activité afin de valider la tâches/l’information reçu pour automatisation du système."));
            },
            icon: Icon(Icons.question_mark),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationSettingsScreen()),
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Globals.profile.notificationsAsReceiver.length != 0
          ? SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount:
                            Globals.profile.notificationsAsReceiver.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NotificationCard(
                              title:
                                  '${Globals.profile.notificationsAsReceiver[index].body}',
                              imagePath:
                                  '${Globals.profile.notificationsAsReceiver[index].imageUrl}',
                              date:
                                  '${Globals.profile.notificationsAsReceiver[index].createdAtDifferenceForHumans}',
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/notif.png"),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Vous n’avez pas de notifications",
                    style: MyTextStyles.subhead.copyWith(color: Colors.grey),
                  )
                ],
              ),
            ),
    );
  }
}
