import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? InitialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChaged;

  const InputTextWidget({ 
    Key? key, 
    required this.label,
    required this.icon,
    this.InitialValue,
    this.validator,
    this.controller,
    required this.onChaged,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Column(
            children: [
              TextFormField(
                controller: controller,
                onChanged: onChaged,
                initialValue: InitialValue,
                validator: validator,
                style: TextStyles.input,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: label,
                  labelStyle: TextStyles.input,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(icon),
                      ),
                      Container(
                        width: 1,
                        height: 48, 
                        color: AppColors.stroke,
                      )
                    ],
                  ),
                  border: InputBorder.none),
              ),
              Divider(
                height: 1,
                thickness:1,
                color: AppColors.stroke,
              ),
            ],
          )],
      ),
    );
  }
}