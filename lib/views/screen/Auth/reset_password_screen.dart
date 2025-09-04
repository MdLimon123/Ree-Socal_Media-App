import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ree_social_media_app/utils/app_colors.dart';
import 'package:ree_social_media_app/views/base/custom_button.dart';
import 'package:ree_social_media_app/views/base/custom_text_field.dart';
import 'package:ree_social_media_app/views/screen/Auth/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
              Text("Set a New \nPassword",
              style: TextStyle(
                color: Color(0xFF413E3E),
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(height: 12,),
              Text("Your new password should be at least 8 characters long",
                style: TextStyle(
                  color: Color(0xFF413E3E),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),),
              SizedBox(height: 40,),
              CustomTextField(controller: newPasswordController,
                hintText: 'New Password',
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
              CustomTextField(controller: confirmPasswordController,
                hintText: 'Confirm Password',
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
              SizedBox(height: 80,),
              CustomButton(onTap: (){
                Get.to(()=> LoginScreen());
              },
                  text: "Save and Continue")

            ],
          ),
        ),
      ),
    );
  }
}
