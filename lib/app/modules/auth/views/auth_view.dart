import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyota/app/constants/app_images.dart';
import 'package:toyota/app/modules/auth/widgets/auth_components.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder<AuthController>(
              init: AuthController(),
              initState: (_) {
                controller.loginFormKey = GlobalKey<FormState>();
              },
              builder: (_) {
                return Form(
                  key: controller.loginFormKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          CostumTextFormFeild(
                            controller: controller.emailController,
                            prefix: Icons.email_outlined,
                            label: 'Votre Email',
                            validate: (value) {
                              return controller.validateEmail(value!);
                            },
                            onSubmit: (value) {
                              controller.email = value;
                            },
                            type: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CostumTextFormFeild(
                            label: 'Mot De Passe',
                            controller: controller.passwordController,
                            type: TextInputType.text,
                            prefix: Icons.lock_outline,
                            onSubmit: (value) {
                              controller.password = value;
                            },
                            isPassword: controller.showPassword,
                            validate: (value) {
                              return controller.validatePassword(value);
                            },
                            suffix: Icons.visibility_outlined,
                            suffixPressed: () {
                              controller.showPassword =
                                  !controller.showPassword;
                              controller.update();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Mot de passe oublié ?",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Defaultbotton(
                            radius: 16.0,
                            text: "Connection",
                            onPress: () {
                              controller.loginFirebase();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyDividerText(
                            text: 'Ou',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialIcon(
                                linkIcon: AppImage.KGoogle,
                              ),
                              SocialIcon(
                                linkIcon: AppImage.KFaceboook,
                              ),
                              SocialIcon(
                                linkIcon: AppImage.KAppel,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Vous n’avez pas un account ?",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/register');
                                },
                                child: Text(
                                  "Inscrire",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
