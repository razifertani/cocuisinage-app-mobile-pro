import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/mes_boutiques/mes_boutiques.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Theme/my_colors.dart';
import '../../shared/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash_screen.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              // height: 60.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Bienvenue ",
                style: MyTextStyles.headline.copyWith(
                    color: MyColors.red,
                    fontSize: 25.sp.clamp(37, 60),
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: "Sur \n",
                    style: MyTextStyles.headline.copyWith(
                        color: Colors.black,
                        fontSize: 25.sp.clamp(37, 60),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Co",
                    style: MyTextStyles.headline.copyWith(
                        color: Colors.black,
                        fontSize: 25.sp.clamp(37, 60),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " cuisinage",
                    style: MyTextStyles.headline.copyWith(
                        color: MyColors.red,
                        fontSize: 25.sp.clamp(37, 60),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " RH",
                    style: MyTextStyles.headline.copyWith(
                        color: MyColors.red,
                        fontSize: 25.sp.clamp(37, 60),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6.w),
              child: Text(
                "Cocuisinage vous simplifie la vie ! L'application qui gère votre commerce de A à Z !!!",
                style: MyTextStyles.body.copyWith(
                    color: Color(0xFF717171), fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              txt: "Commencer",
              fun: (startLoading, stopLoading, btnState) async {
                if (btnState == ButtonState.Idle) {
                  startLoading();
                  try {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (prefs.getBool('rememberMe') ?? false) {
                      loginWS(
                        email: prefs.getString('email')!,
                        password: prefs.getString('password')!,
                      ).then((exceptionOrProfile) {
                        stopLoading();
                        exceptionOrProfile.fold(
                          (exception) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                            );
                          },
                          (bool) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MesBoutiquesScreen()),
                            );
                          },
                        );
                      });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    }
                  } catch (e) {
                    print(e);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
