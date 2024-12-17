import 'package:flutter/material.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/core/utils/extensions.dart';

class ButtonHaveAccount extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonHaveAccount({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomTextL(
          "Have_an_Account",
          fontSize: 15,
        ),
        4.ESW(),
        InkWell(
          onTap: onTap,
          child: const CustomTextL(
            "LOG_IN",
            fontWeight: FW.bold,
            decoration: CustomTextDecoration.underLine,
          ),
        )
      ],
    );
  }
}
