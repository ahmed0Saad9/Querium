import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/services/svg_widget.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<DropdownMenuEntry<String>> items;
  final String hint;
  final TextEditingController? controller;
  const CustomDropDownMenu({
    super.key,
    required this.items,
    required this.hint,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        hintText: hint.tr,
        width: 357.w,
        controller: controller,
        menuStyle: const MenuStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
            elevation: MaterialStatePropertyAll(1),
            backgroundColor: MaterialStatePropertyAll(Colors.white)),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: AppColors.main,
            fontFamily: 'Medium',
          ),
          filled: true,
          fillColor: TextFieldColors.backGroundWhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.main),
          ),
        ),
        trailingIcon: const IconSvg('DropDownMenuArrow'),
        selectedTrailingIcon: const Icon(
          Icons.keyboard_arrow_up_rounded,
          size: 24,
        ),
        dropdownMenuEntries: items);
  }
}
