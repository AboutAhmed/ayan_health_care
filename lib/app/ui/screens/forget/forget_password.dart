import 'package:ayan_healthcare/app/controller/user/forgot_password_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPasswordController = Get.put(ForgotPasswordController());
    final S s = S.of(context);
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "",
          ),
        ),
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
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    6.kH,
                    Text(s.forget_password, style: largeHeadings),
                    1.kH,
                    Text(s.enter_email_reset_password,
                        style: regularText.copyWith(fontSize: 16)),
                    8.kH,
                    sectionSmallSpacerVertically(),
                    TextFormField(
                      controller: emailController,
                      maxLength: 50,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (text) => Get.focusScope!.unfocus(),
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
                    6.kH,
                    Obx(
                      () => CustomButton(
                        text: s.reset,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            forgotPasswordController
                                .forgotPassword(emailController.text.trim())
                                .then((_) {
                              Get.offAllNamed(AppRoutes.login);
                            });
                          }
                        },
                        isLoading: forgotPasswordController.isLoading.value,
                      ),
                    ),
                    4.kH,
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
