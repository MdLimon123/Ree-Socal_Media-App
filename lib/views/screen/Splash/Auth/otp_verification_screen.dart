import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ree_social_media_app/utils/app_colors.dart';
import 'package:ree_social_media_app/views/base/custom_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final controllers = List.generate(6, (_) => TextEditingController());
  final nodes = List.generate(6, (_) => FocusNode());
  @override
  void dispose() {
    for (final c in controllers) c.dispose();
    for (final n in nodes) n.dispose();
    super.dispose();
  }

  void _handleChange(int i, String v) {
    // paste support: if user pastes multiple digits in one field
    if (v.length > 1) {
      final chars = v.replaceAll(RegExp(r'\D'), '').split('');
      for (int j = 0; j < chars.length && i + j < controllers.length; j++) {
        controllers[i + j].text = chars[j];
      }
      final next = (i + chars.length).clamp(0, controllers.length - 1);
      nodes[next].requestFocus();
      setState(() {});
      return;
    }

    if (v.isNotEmpty && i < 5) {
      nodes[i + 1].requestFocus();
    } else if (v.isEmpty && i > 0) {
      nodes[i - 1].requestFocus();
    }
    setState(() {}); // repaint for color change
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
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
              Text("Check Your \nInbox",
                style: TextStyle(
                  color: Color(0xFF413E3E),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,

                ),),
              SizedBox(height: 12,),
              Text("We've sent a 6-digit code ending in 56",
              style: TextStyle(
                color: Color(0xFF413E3E),
                fontSize: 16,
                fontWeight: FontWeight.w400,

              ),),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (i) => _otpBox(i)),
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Resend code after",
                  style: TextStyle(
                    color: Color(0xFF413E3E),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                  SizedBox(width: 8,),
                  Text("60s",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),)
                ],
              ),
              SizedBox(height: 92,),
              CustomButton(onTap: (){},
                  text: "Verify Code")


            ],
          ),
        ),
      ),
    );
  }

   _otpBox(int i) {
    final filled = controllers[i].text.isNotEmpty;

    return Container(
      width: 48,
      height: 48,
      margin: EdgeInsets.only(right: i == 5 ? 0 : 5),
      decoration: BoxDecoration(
        color: filled ? AppColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: filled ? Colors.transparent : Color(0xFFC4C3C3), width: 1.2),
        boxShadow: filled
            ? [BoxShadow(color: AppColors.primaryColor.withValues(alpha: .35), blurRadius: 8, offset: const Offset(0, 2))]
            : const [],
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controllers[i],
        focusNode: nodes[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: filled ? Colors.white : AppColors.textColor,
        ),
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          counterText: '',
          isCollapsed: true,
          border: InputBorder.none,
          hintText: '*',
          hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB6B6B6)),
        ),
        onChanged: (v) => _handleChange(i, v),
      ),
    );
  }
}
