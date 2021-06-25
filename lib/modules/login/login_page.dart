import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widget/social_login/social_login_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 40,
                child: Image.asset(
                  AppImages.person,
                  width: 208,
                  height: 300,
                )),
            Positioned(
                bottom: size.height * 0.05,
                left: 0,
                right: 0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logomini),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 70, right: 70),
                        child: Text("Organize your slips in one place",
                            style: TextStyles.titleHome,
                            textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 40),
                          child: SocialLoginButton(
                            onTap: () async {
                              GoogleSignIn _googleSignIn = GoogleSignIn(
                                scopes: [
                                  'email',
                                  'https://www.googleapis.com/auth/contacts.readonly',
                                ],
                              );
                              try {
                                final response = await _googleSignIn.signIn();
                                print(response);
                              } catch (error) {
                                print(error);
                              }
                            },
                          ),
                      ),
                    ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
