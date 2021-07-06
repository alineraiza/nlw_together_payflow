import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widget/input_text/input_text_widget.dart';
import 'package:payflow/shared/widget/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatelessWidget {
  const InsertBoletoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93,),
              child: Text(
                "Fill in the billet data",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),
            InputTextWidget(
              label: "Billet name",
              icon: Icons.description_outlined,
              onChaged: (value) {},
            ),
            InputTextWidget(
              label: "Due date",
              icon: FontAwesomeIcons.timesCircle,
              onChaged: (value) {},
            ),
            InputTextWidget(
              label: "Value",
              icon: FontAwesomeIcons.wallet,
              onChaged: (value) {},
            ),
            InputTextWidget(
              label: "Code",
              icon: FontAwesomeIcons.barcode,
              onChaged: (value) {},
            ),
          ]
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        enableSecundaryColor: true,
        primaryLabel: "Cancel", 
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secundaryLabel: "Register",
        secundaryOnPressed: (){}
      ),
    );
  }
}