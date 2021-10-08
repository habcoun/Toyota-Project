import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toyota/app/modules/home/views/home_view.dart';

import '../firebase_auth_helper.dart';

class AuthController extends GetxController {
  var showPassword = true;
  var showRePassword = true;

  GlobalKey<FormState>? loginFormKey = GlobalKey();

  GlobalKey<FormState>? registerLoginFormKey;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  var email = '';
  var password = '';
  var name = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    nameController.dispose();
  }

  String? validateName(String value) {
    if (GetUtils.isLengthLessOrEqual(value, 2)) {
      return 'Entre un Nom Valide , le Nom et torp court !';
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Votre email non valide';
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    } else {
      return null;
    }
  }

  String? validatePasswordRegister(String value, String rePassword) {
    if (value.length < 6) {
      return 'Le mot de passe doit contenir au moins 6 caractères';
    } else if (value != rePassword) {
      return "Le mot de passe de confirmation n'est pas identique ";
    } else {
      return null;
    }
  }

  void registerFirebase() async {
    final isValide = registerLoginFormKey!.currentState!.validate();
    if (isValide) {
      User? currentUser = FirebaseAuthHelper().user;
      print(currentUser!.uid);
      // Get.off(() => HomeView());
    } else {
      Get.snackbar(
        'Problème de connexion',
        'result',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFB00000),
        colorText: Colors.white,
        icon: Icon(
          Icons.dangerous,
          color: Colors.white,
          size: 30,
        ),
      );
    }
  }

  void loginFirebase() async {
    final isValide = loginFormKey!.currentState!.validate();
    if (isValide) {
      FirebaseAuthHelper()
          .signIn(
              email: emailController.text, password: passwordController.text)
          .then((result) {
        if (result == null) {
          User? currentUser = FirebaseAuthHelper().user;
          print(currentUser!.uid);
          Get.off(() => HomeView());
        } else {
          Get.snackbar(
            'Problème de connexion',
            result,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xFFB00000),
            colorText: Colors.white,
            icon: Icon(
              Icons.dangerous,
              color: Colors.white,
              size: 30,
            ),
          );
        }
      });
    }
  }
}
