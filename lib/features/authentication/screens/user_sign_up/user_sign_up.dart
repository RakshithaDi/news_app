import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/localization/english_content.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/common/utils/assets_paths.dart';
import 'package:news_app/common/utils/regex_keys.dart';
import 'package:news_app/common/utils/screen_size_util.dart';
import 'package:news_app/features/authentication/models/user_model.dart';
import 'package:news_app/features/authentication/providers/sign_up_provider.dart';
import 'package:news_app/features/authentication/utils/text_fields_validations.dart';
import 'package:news_app/features/authentication/widgets/custom_text_form_field.dart';
import 'package:news_app/features/authentication/widgets/rounded_elavated_button.dart';
import 'package:provider/provider.dart';

class ScreenUserSignUp extends StatefulWidget {
  const ScreenUserSignUp({super.key});

  @override
  State<ScreenUserSignUp> createState() => _ScreenUserSignUpState();
}

class _ScreenUserSignUpState extends State<ScreenUserSignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
          Consumer<SignupProvider>(builder: (context, auhtController, _) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
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
                                "Sing Up",
                                style: TextStyle(fontSize: 30),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextFormField(
                                controller: nameController,
                                labelText: "Name",
                                validator: TextFieldValiations.validateName,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(RegexHelper.name_Regex))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
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
                                height: 20,
                              ),
                              CustomTextFormField(
                                controller: confirmPasswordController,
                                labelText: "Confirm Password",
                                obscureText: true,
                                validator: (value) {
                                  RegExp regex = RegExp(RegexHelper.name_Regex);
                                  if (value == null || value!.isEmpty) {
                                    return 'Please re-enter your password';
                                  } else if (passwordController.text != value) {
                                    return 'Password does not match!';
                                  }
                                  return null;
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(RegexHelper.password_regex))
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              auhtController.isLoading
                                  ? CircularProgressIndicator()
                                  : RoundedButtonWidget(
                                      buttonText: "Signup",
                                      onpressed: () {
                                        if (formKey.currentState!.validate()) {
                                          //create an user intance with filled data
                                          UserModel userModel = UserModel(
                                              email:
                                                  emailController.text.trim(),
                                              password:
                                                  confirmPasswordController.text
                                                      .trim(),
                                              name: nameController.text.trim());
                                          //add user to local db
                                          auhtController.signUp(
                                              context, userModel);
                                        }
                                      },
                                      width: double.maxFinite,
                                    ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an account?'),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(0),
                                        visualDensity:
                                            VisualDensity.comfortable,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Sigin',
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
        );
      })),
    );
  }
}
