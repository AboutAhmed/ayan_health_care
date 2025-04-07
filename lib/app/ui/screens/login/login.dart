import 'package:ayan_healthcare/app/controller/user/login_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Login extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  // Future<void> _handleLogin() async {
  //   if (!_formKey.currentState!.validate()) return;

  //   try {
  //     // Login with Firebase
  //     final userCredential = await _auth.signInWithEmailAndPassword(
  //       email: loginController.emailController.text,
  //       password: loginController.passwordController.text,
  //     );

  //     // Get user data from Firestore
  //     final userData = await _firestore
  //         .collection('users')
  //         .doc(userCredential.user!.uid)
  //         .get();

  //     if (userData.exists) {
  //       // Store user data in provider/state management
  //       // Navigate to home screen
  //       Get.offNamed('/home');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Login failed', e.toString(),
  //         snackPosition: SnackPosition.BOTTOM);
  //   } finally {}
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context)
                .unfocus(); // Unfocus the text fields when tapping outside
          },
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    6.kH,
                    Center(
                      child: Image.asset(
                        "assets/logo/ayan_logo.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    6.kH,
                    sectionSmallSpacerVertically(),
                    TextFormField(
                      maxLength: 50,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: loginController.emailController,
                      validator: (text) {
                        if (text!.trim().isEmpty)
                          return S.of(context).field_empty;
                        if (!GetUtils.isEmail(text)) {
                          return S.of(context).invalid_email;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: S.of(context).email_example,
                        labelText: 'Email',
                        counterText: "",
                        suffixIcon: const Icon(Icons.email),
                      ),
                    ),
                    widgetSpacerVertically(),
                    Obx(() => TextFormField(
                          maxLength: 50,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          controller: loginController.passwordController,
                          validator: (text) {
                            if (text!.trim().isEmpty) {
                              return S.of(context).password_empty;
                            }
                            return null;
                          },
                          obscureText: !loginController.isPasswordVisible.value,
                          decoration: InputDecoration(
                            hintText: S.of(context).enter_password,
                            labelText: S.of(context).password,
                            counterText: "",
                            suffixIcon: IconButton(
                              icon: Icon(
                                loginController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                loginController.togglePasswordVisibility();
                              },
                            ),
                          ),
                        )),
                    widgetSpacerVertically(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.resetPassword);
                        },
                        child: Text(
                          S.of(context).forget_password,
                          style: subTitles.copyWith(
                              color: AppColors.textSecondary),
                        ),
                      ),
                    ),
                    4.kH,
                    Row(
                      children: [
                        Obx(() => Expanded(
                              flex: 3,
                              child: CustomButton(
                                text: S.of(context).login,
                                onPressed: loginController.login,
                                isLoading: loginController.isLoading.value,
                              ),
                            )),
                        1.kW,
                        // Expanded(
                        //   child: InkWell(
                        //       onTap: () {
                        //         loginController.authenticate();
                        //       },
                        //       child: Icon(
                        //         Icons.fingerprint_outlined,
                        //         color: AppColors.primaryColor,
                        //         size: 40,
                        //       )),
                        // )
                      ],
                    ),
                    // 4.kH,
                    // Row(
                    //   children: [
                    //     Obx(() => Checkbox(
                    //           value: loginController.rememberMe.value,
                    //           onChanged: (value) {
                    //             loginController.toggleRememberMe();
                    //           },
                    //         )),
                    //     Text("Remember me"),
                    //   ],
                    // ),
                    4.kH,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: S.of(context).dont_have_account,
                          style: Get.theme.textTheme.titleSmall!.copyWith(),
                          children: [
                            TextSpan(
                              text: S.of(context).get_registered,
                              style: Get.theme.textTheme.titleSmall?.copyWith(
                                color: AppColors.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(AppRoutes.signup),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.kH,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Powered by ',
                          style: Get.theme.textTheme.titleSmall
                              ?.copyWith(color: AppColors.textSecondary),
                          children: [
                            TextSpan(
                              text: 'InstaCare.pk',
                              style: Get.theme.textTheme.titleSmall
                                  ?.copyWith(color: AppColors.primaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await _launchURL("https://instacare.pk/", "");
                                },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL(String primaryUrl, String fallbackUrl) async {
  try {
    bool launched = await launchUrlString(primaryUrl);
    if (!launched) {
      await launchUrlString(fallbackUrl);
    }
  } catch (e) {
    await launchUrlString(fallbackUrl);
  }
}
