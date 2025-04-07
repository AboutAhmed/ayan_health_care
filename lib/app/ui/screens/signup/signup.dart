import 'package:ayan_healthcare/app/controller/user/signup_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    final S s = S.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

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
                key: signupController.signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    6.kH,
                    Text(s.getting_started, style: largeHeadings),
                    1.kH,
                    Text(s.create_account,
                        style: regularText.copyWith(fontSize: 16)),
                    6.kH,

                    // Full Name Field
                    TextFormField(
                      controller: signupController.fullNameController,
                      maxLength: 50,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) =>
                          FocusScope.of(context).nextFocus(),
                      validator: (text) {
                        if (text!.trim().isEmpty) {
                          return s.name_empty;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: s.enter_full_name,
                        labelText: s.full_name,
                        counterText: "",
                        suffixIcon: const Icon(Icons.person),
                      ),
                    ),
                    widgetSpacerVertically(),

                    // Phone Number Field
                    TextFormField(
                      controller: signupController.phoneNumberController,
                      maxLength: 15,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) =>
                          FocusScope.of(context).nextFocus(),
                      validator: (text) {
                        if (text!.trim().isEmpty) {
                          return s.phone_empty;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: s.phone_example,
                        labelText: s.phone,
                        counterText: "",
                        suffixIcon: const Icon(Icons.phone),
                      ),
                    ),
                    widgetSpacerVertically(),

                    // Email Field
                    TextFormField(
                      controller: signupController.emailController,
                      maxLength: 50,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) =>
                          FocusScope.of(context).nextFocus(),
                      validator: (text) {
                        if (text!.trim().isEmpty) return s.field_empty;
                        if (!GetUtils.isEmail(text)) {
                          return s.invalid_email;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: s.email_example,
                        labelText: s.email,
                        counterText: "",
                        suffixIcon: const Icon(Icons.email),
                      ),
                    ),
                    widgetSpacerVertically(),

                    // Password Field
                    TextFormField(
                      controller: signupController.passwordController,
                      maxLength: 50,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) =>
                          FocusScope.of(context).nextFocus(),
                      validator: (text) {
                        if (text!.trim().isEmpty) {
                          return s.password_empty;
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: s.enter_password,
                        labelText: s.password,
                        counterText: "",
                        suffixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    widgetSpacerVertically(),

                    // CNIC Field
                    TextFormField(
                      controller: signupController.cnicController,
                      maxLength: 13,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) =>
                          FocusScope.of(context).nextFocus(),
                      validator: (text) {
                        if (text!.trim().isEmpty) return s.cnic_empty;
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: s.enter_cnic,
                        labelText: s.cnic,
                        counterText: "",
                        suffixIcon: const Icon(Icons.credit_card),
                      ),
                    ),
                    widgetSpacerVertically(),

                    // Gender Selection
                    DropdownButtonFormField<String>(
                      value: signupController.genderController.text.isEmpty
                          ? null
                          : signupController.genderController.text,
                      onChanged: (value) {
                        signupController.genderController.text = value!;
                      },
                      decoration: InputDecoration(
                        labelText: s.gender,
                        suffixIcon: const Icon(Icons.accessibility),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return s.select_gender;
                        }
                        return null;
                      },
                      items: [s.male, s.female, s.other]
                          .map((gender) => DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                    ),

                    widgetSpacerVertically(),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                              value: signupController.isTermsAccepted.value,
                              onChanged: signupController.toggleTermsAcceptance,
                              activeColor:
                                  AppColors.primaryColor, // Set primary color
                            )),
                        RichText(
                          text: TextSpan(
                            text: s.terms_agree,
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: s.terms_conditions,
                                style: const TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to Terms & Conditions page
                                    // Get.toNamed('/terms_conditions');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    2.kH,

                    // Signup Button
                    Row(
                      children: [
                        Obx(() => Expanded(
                              flex: 3,
                              child: CustomButton(
                                text: s.signup,
                                onPressed: signupController.signup,
                                isLoading: signupController.isLoading.value,
                              ),
                            )),
                      ],
                    ),
                    sectionSmallSpacerVertically(),

                    // Terms and Conditions Link
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: s.have_account,
                          style: Get.theme.textTheme.titleSmall!.copyWith(),
                          children: [
                            TextSpan(
                              text: s.login,
                              style: Get.theme.textTheme.titleSmall!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => Get.offAllNamed(AppRoutes.login),
                            ),
                          ],
                        ),
                      ),
                    ),
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
