import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ree_social_media_app/utils/app_colors.dart';
import 'package:ree_social_media_app/views/base/custom_button.dart';
import 'package:ree_social_media_app/views/base/custom_text_field.dart';
import 'package:ree_social_media_app/views/screen/Auth/forget_password.dart';
import 'package:ree_social_media_app/views/screen/Auth/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 36,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text("re:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ))
                ),
              ),
              SizedBox(height: 110,),
              Text("Glad to See You \nAgain!",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(height: 40,),
              CustomTextField(controller: emailTextController,
              hintText: 'Enter your phone number or email',
              isEmail: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset('assets/icons/phone.svg'),
                  )
                ),
              ),),
              SizedBox(height: 12,),
              CustomTextField(controller: passwordTextController,
                hintText: 'Enter your Password',
                isPassword: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset('assets/icons/lock.svg'),
                      )
                  ),
                ),),
              SizedBox(height: 12,),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    Get.to(()=> ForgetPassword());
                  },
                  child: Text("Forgot Password?",
                  style: TextStyle(
                    color: Color(0xFF799777),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                ),
              ),
              SizedBox(height: 80,),
              CustomButton(onTap: (){}, text: "Log In"),
              SizedBox(height: 12,),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have an account?",
                    style: TextStyle(
                        color: Color(0xFF676565),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: " Sign up",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          Get.to(()=> SignupScreen());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
