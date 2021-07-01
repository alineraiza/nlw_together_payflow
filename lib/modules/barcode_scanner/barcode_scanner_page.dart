
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widget/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widget/label_button/label_button.dart';
import 'package:payflow/shared/widget/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({ Key? key }) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Scan the boleto barcode", 
            style: TextStyles.buttonBackground,
          ),
          centerTitle: true,
          leading: BackButton(color: AppColors.background),
        ),
            
          body: Column(children: [
            Expanded(child: Container(color: Colors.black.withOpacity(0.7))),
            Expanded(flex: 2, child: Container(color: Colors.transparent)),
            Expanded(child: Container(color: Colors.black.withOpacity(0.7))),
          ]),

          bottomNavigationBar: SetLabelButtons(
            primaryLabel: "Insert boleto code", 
            primaryOnPressed:(){},
            secundaryLabel: "Add from galerry", 
            secundaryOnPressed:(){},
          ),
        ),
      ),
    );
  }
}