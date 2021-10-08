import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyota/app/constants/app_images.dart';
import 'package:toyota/app/modules/auth/widgets/auth_components.dart';
import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
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
                controller.registerLoginFormKey = GlobalKey<FormState>();
              },
              builder: (_) {
                return Form(
                  key: controller.registerLoginFormKey,
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
                            controller: controller.nameController,
                            prefix: Icons.email_outlined,
                            label: 'Votre Nom',
                            validate: (value) {
                              return controller.validateName(value!);
                            },
                            onSubmit: (value) {
                              controller.name = value;
                            },
                            type: TextInputType.text,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CostumTextFormFeild(
                            controller: controller.emailController,
                            prefix: Icons.email_outlined,
                            label: 'Votre Email',
                            validate: (value) {
                              return controller.validateEmail(value!);
                            },
                            onSubmit: (value) {
                              controller.name = value;
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
                            height: 15,
                          ),
                          CostumTextFormFeild(
                            label: 'Répéter le Mot De Passe',
                            controller: controller.rePasswordController,
                            type: TextInputType.text,
                            prefix: Icons.lock_outline,
                            onSubmit: (value) {
                              // controller.password = value;
                            },
                            isPassword: controller.showRePassword,
                            validate: (value) {
                              return controller.validatePasswordRegister(
                                value,
                                controller.passwordController.text,
                              );
                            },
                            suffix: Icons.visibility_outlined,
                            suffixPressed: () {
                              controller.showRePassword =
                                  !controller.showRePassword;
                              controller.update();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Defaultbotton(
                            radius: 16.0,
                            text: "Inscrire",
                            onPress: () {
                              controller.registerFirebase();
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
                                "Vous avez déja un account ?",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/auth');
                                },
                                child: Text(
                                  "Connection",
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
