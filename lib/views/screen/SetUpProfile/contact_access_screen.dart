import 'package:flutter/material.dart';
import 'package:ree_social_media_app/utils/app_colors.dart';
import 'package:ree_social_media_app/views/base/custom_button.dart';

class ContactAccessScreen extends StatefulWidget {
  const ContactAccessScreen({super.key});

  @override
  State<ContactAccessScreen> createState() => _ContactAccessScreenState();
}

class _ContactAccessScreenState extends State<ContactAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                 Text("1 of 4",
                 style: TextStyle(
                   color: Color(0xFF413E3E),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   decoration: TextDecoration.underline,
                   decorationColor: AppColors.primaryColor
                 ),)
               ],
             ),
              SizedBox(height: 110,),
              Text("Access Your \nContacts",
              style: TextStyle(
                color: Color(0xFF413E3E),
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(height: 12,),
              Text("We'll use your contacts to invite friends to re: and show you who is already on the app. Your info stays private",
              style: TextStyle(
                color: Color(0xFF413E3E),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(height: 80,),

              Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFC4C3C3), width: 0.5)
                ),
                child: Center(
                  child: Text("Not Now",
                  style: TextStyle(
                    color: Color(0xFF676565),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              ),
              SizedBox(height: 20,),
              CustomButton(onTap: (){

              },
                  text: "Allow Access")


            ],
          ),
        ),
      )
    );
  }
}
