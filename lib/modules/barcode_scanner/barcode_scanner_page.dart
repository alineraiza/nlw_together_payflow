import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widget/buttom_sheet/buttom_sheet.dart';
import 'package:payflow/shared/widget/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller. status.hasBarcode){
        Navigator.pushReplacementNamed(context, "/insert_boleto", 
          arguments: controller.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
                Expanded(
                    child: Container(color: Colors.black.withOpacity(0.7))),
                Expanded(flex: 2, child: Container(color: Colors.transparent)),
                Expanded(
                    child: Container(color: Colors.black.withOpacity(0.7))),
              ]),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Insert boleto code",
                primaryOnPressed: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                secundaryLabel: "Add from galerry",
                secundaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  title: "It was not possible to identify a barcode",
                  subtitle: "Try to scan again or enter your bank slip code",
                  primaryLabel: "scan again",
                  primaryOnPressed: () {
                    controller.scanWithCamera();
                  },
                  secundaryLabel: "Enter code",
                  secundaryOnPressed: () {
                    Navigator.pushReplacementNamed(context, "/insert_boleto");
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
