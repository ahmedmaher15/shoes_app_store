import 'package:flutter/material.dart';
import 'package:shoes_app_store/utils/dimensions.dart';


class CustomSpacer extends StatelessWidget {
  const CustomSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: Dimensions.height20,
    );
  }
}
