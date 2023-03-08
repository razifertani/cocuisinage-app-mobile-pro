import 'package:cocuisinage_app_mobile_pro_mobile_pro/controllers/theme_controller.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/caisse/caisse_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/on_boarding_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider<ThemeController>(create: (_) {
        return ThemeController();
      }, child: Consumer<ThemeController>(
        builder: (context, value, child) {
          return MaterialApp(
            theme: value.themeData,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ));
    });
  }
}
