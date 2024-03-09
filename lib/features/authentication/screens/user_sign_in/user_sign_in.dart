import "package:flutter/material.dart";
import "package:news_app/common/localization/english_content.dart";
import "package:news_app/common/utils/assets_paths.dart";
import "package:news_app/common/utils/screen_size_util.dart";
import "package:news_app/features/authentication/widgets/custom_text_form_field.dart";
import "package:news_app/features/authentication/widgets/rounded_elavated_button.dart";

class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: ScreenSizeUtil.screenHeight,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [Color(0xFFFF3A44), Color(0xFFFF8086)],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: ScreenSizeUtil.screenHeight * 0.02),
                        child: Column(
                          children: [
                            const Text(
                              app_logo_name,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Image.asset(
                              AssetPaths.APP_LOGO,
                              width: 180,
                              height: 180,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                          top: ScreenSizeUtil.screenHeight * 0.3),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 250, 230, 230)
                            ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Login",
                              style: TextStyle(fontSize: 30),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextFormField(
                              controller: emailController,
                              labelText: "Email",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: passwordController,
                              labelText: "password",
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RoundedButtonWidget(
                              buttonText: "Login",
                              onpressed: () {},
                              width: double.maxFinite,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              children: [
                Text('Dont have any account?  '),
                Text('Signup'),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
