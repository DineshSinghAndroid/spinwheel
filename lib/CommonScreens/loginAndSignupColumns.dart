import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';

import '../Controller/Helper/BuildText/BuildText.dart';
import 'Onboarding/appOnboardingController.dart';

class LoginColumn extends StatelessWidget {
  LoginColumn({super.key});

  final AppOnboardingController _onBdCtrl = Get.put(AppOnboardingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _onBdCtrl,
      builder: (controller) {
        return Scaffold(
          body: LoadScreen(
              widget: SingleChildScrollView(
                child: Container(
                  height: 400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        hint: "Enter Your PhoneNumber",
                        ctrl: _onBdCtrl.userPhoneCtrl,
                        type: TextInputType.number,
                      ),
                      buildSizeBox(15.0, 0.0),
                      CustomTextFormField(
                          type: TextInputType.visiblePassword,
                          hint: "Enter Your Password",
                          ctrl: _onBdCtrl.userpasswordCtrl,
                          obsText: true,
                          eye: true),
                      buildSizeBox(15.0, 0.0),
                      BuildText.buildText(
                          text: "Forgot Your Password ?",
                          size: 16,
                          color: Colors.green),
                      buildSizeBox(40.0, 0.0),
                      Center(
                        child: NeoPopTiltedButton(
                          isFloating: true,
                          onTapUp: () => _onBdCtrl.onTapLogin(context),
                          // onTapDown: () => _onBdCtrl.onTapLogin(context),
                          decoration: const NeoPopTiltedButtonDecoration(
                            color: Color.fromRGBO(255, 235, 52, 1),
                            plunkColor: Color.fromRGBO(255, 235, 52, 1),
                            shadowColor: Color.fromRGBO(36, 36, 36, 1),
                            showShimmer: true,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 70.0,
                              vertical: 15,
                            ),
                            child: BuildText.buildText(
                                text: "Login",
                                size: 14,
                                color: Colors.black,
                                weight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isLoading: _onBdCtrl.isLoading),
        );
      },
    );
  }

  TextFormField CustomTextFormField({
    required String hint,
    required TextEditingController ctrl,
    bool? obsText,
    bool? eye,
    TextInputType? type,
  }) {
    return TextFormField(
      controller: ctrl,
      obscureText: obsText ?? false,
      keyboardType: type ?? TextInputType.text,
      decoration: InputDecoration(
          suffix: eye == true ? const Icon(Icons.remove_red_eye) : Text(""),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.red, width: .5),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1)),
      enabled: true,
    );
  }
}

class RegisterColumn extends StatelessWidget {
  RegisterColumn({super.key});

  final AppOnboardingController _onBdCtrl = Get.put(AppOnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hint: "Enter Your Name",
                ctrl: _onBdCtrl.userNameCtrl,
                type: TextInputType.name,
              ),
              buildSizeBox(15.0, 0.0),
              CustomTextFormField(
                hint: "Enter Your PhoneNumber",
                ctrl: _onBdCtrl.userPhoneCtrl,
                type: TextInputType.number,
              ),
              buildSizeBox(15.0, 0.0),
              CustomTextFormField(
                  hint: "Enter Your Email",
                  type: TextInputType.emailAddress,
                  ctrl: _onBdCtrl.userEmailCtrl),
              buildSizeBox(15.0, 0.0),
              CustomTextFormField(
                  hint: "Enter Your Password",
                  ctrl: _onBdCtrl.userpasswordCtrl,
                  obsText: true,
                  type: TextInputType.visiblePassword,
                  eye: true),
              buildSizeBox(10.0, 0.0),
              BuildText.buildText(
                  text: "By Registering you agree to our terms and conditions",
                  size: 16,
                  color: Colors.green),
              buildSizeBox(15.0, 0.0),
              Center(
                child: NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: () => _onBdCtrl.onTapRegister(context),
                  // onTapDown: () => _onBdCtrl.onTapRegister(context),
                  decoration: const NeoPopTiltedButtonDecoration(
                    color: Color.fromRGBO(255, 235, 52, 1),
                    plunkColor: Color.fromRGBO(255, 235, 52, 1),
                    shadowColor: Color.fromRGBO(36, 36, 36, 1),
                    showShimmer: true,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 70.0,
                      vertical: 15,
                    ),
                    child: BuildText.buildText(
                        text: "Register",
                        size: 14,
                        color: Colors.black,
                        weight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField CustomTextFormField({
    required String hint,
    required TextEditingController ctrl,
    bool? obsText,
    bool? eye,
    TextInputType? type,
  }) {
    return TextFormField(
      keyboardType: type ?? TextInputType.text,
      controller: ctrl,
      obscureText: obsText ?? false,
      decoration: InputDecoration(
          suffix: eye == true ? Icon(Icons.remove_red_eye) : Text(""),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.red, width: .5),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.grey, width: .5),
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1)),
      enabled: true,
    );
  }
}
