import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:news_app/common/localization/english_content.dart";
import "package:news_app/common/theme/app_theme.dart";
import "package:news_app/common/utils/assets_paths.dart";
import "package:news_app/common/utils/regex_keys.dart";
import "package:news_app/common/utils/screen_size_util.dart";
import "package:news_app/features/authentication/providers/sign_in_provider.dart";
import "package:news_app/features/authentication/providers/sign_up_provider.dart";
import "package:news_app/features/authentication/screens/user_sign_up/user_sign_up.dart";
import "package:news_app/features/authentication/utils/text_fields_validations.dart";
import "package:news_app/features/authentication/widgets/custom_text_form_field.dart";
import "package:news_app/features/authentication/widgets/rounded_elavated_button.dart";
import "package:provider/provider.dart";

class ScreenSignIn extends StatefulWidget {
  ScreenSignIn({super.key});

  @override
  State<ScreenSignIn> createState() => _ScreenSignInState();
}

class _ScreenSignInState extends State<ScreenSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signinProvider = Provider.of<SigninProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: ScreenSizeUtil.screenHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Color.fromARGB(255, 252, 99, 107),
                      Color.fromARGB(255, 250, 146, 151),
                      Color.fromARGB(255, 250, 194, 196)
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
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
                          APP_LOGO,
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: AppTheme.formBackgroundGradientColors),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
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
                              validator: TextFieldValiations.validateEmail,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(RegexHelper.email_regex))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: passwordController,
                              labelText: "password",
                              obscureText: true,
                              validator: TextFieldValiations.validatePassword,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(RegexHelper.password_regex))
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Consumer<SigninProvider>(
                                builder: (context, loginPrv, _) {
                              return loginPrv.isLoading
                                  ? const CircularProgressIndicator()
                                  : RoundedButtonWidget(
                                      buttonText: "Login",
                                      onpressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          signinProvider.signIn(context,
                                              email:
                                                  emailController.text.trim(),
                                              password: passwordController.text
                                                  .trim());
                                        }
                                      },
                                      width: double.maxFinite,
                                    );
                            }),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Dont have any account?'),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      visualDensity: VisualDensity.comfortable,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenUserSignUp(),
                                          ));
                                    },
                                    child: const Text(
                                      'Signup',
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
