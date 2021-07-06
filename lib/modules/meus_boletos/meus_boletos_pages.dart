

import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widget/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({ Key? key }) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Text("My Billet",
              style: TextStyles.titleBoldHeading,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:24),
          child: Divider(
            thickness: 2,
            height: 1,
            color: AppColors.stroke,
          ),
        ),
        BoletoListWidget(),
      ],
    );
  }
}