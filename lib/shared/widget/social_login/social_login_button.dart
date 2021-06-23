import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({ Key? key, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: onTap,
          child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: (AppColors.shape),
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(BorderSide(color: (AppColors.stroke))),
          
        ),
        child: Row(
          children:[
            Expanded(flex:1, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.google),
                SizedBox(width:16),
                Container(
                  
                  height: 56, width:2, color: AppColors.stroke),
              ]
            )),
            Expanded(
              flex:4, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("login with Google", style: TextStyles.buttonGray,),
              ],
            )),
          ]
        ),
        
      ),
    );
  }
}