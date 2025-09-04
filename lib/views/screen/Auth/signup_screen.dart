import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ree_social_media_app/utils/app_colors.dart';
import 'package:ree_social_media_app/views/base/custom_button.dart';
import 'package:ree_social_media_app/views/base/custom_text_field.dart';
import 'package:ree_social_media_app/views/screen/Auth/email_verify_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool isCheck = false;

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
              Text("Sign Up in \nSeconds",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),),
              SizedBox(height: 12,),
              Text("Create an account to capture and share real reactions",
              style: TextStyle(
                color: Color(0xFF413E3E),
                fontSize: 16,
                fontWeight: FontWeight.w400,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: AppColors.primaryColor,
                      value: isCheck,
                      onChanged: (val){
                        setState(() {
                          isCheck = val!;
                        });

                      }),

                  RichText(text: TextSpan(
                    text: "You agree to the",
                    style: TextStyle(
                        color: Color(0xFF676565),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " and\n acknowledge you have read the ",
                        style: TextStyle(
                            color: Color(0xFF676565),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: "Privacy \nPolicy",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(height: 80,),
              CustomButton(onTap: (){
                Get.to(()=> EmailVerifyScreen());
              }, text: "Agree and Continue"),
            ],
          ),
        ),
      ),
    );
  }
}
