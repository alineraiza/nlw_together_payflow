import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({ Key? key, required this.size }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secundary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.logomini,
            color: AppColors.background,
            width: 56,
            height:34,
            ),
            Container(
              width: 1, 
              height: 32,
              color: AppColors.background,
            ),
            Text.rich(TextSpan(
              text: "You have ",
              style: TextStyles.captionBackground,
              children: [
                TextSpan(
                  text: "$size Billet\n",
                  style: TextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: "Registered to pay",
                  style: TextStyles.captionBackground,
                ),
              ],
            ))
          ]
        ),
      ),
    );
  }
}