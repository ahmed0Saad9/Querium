import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/academic_year_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/subjects_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/academic_year_model.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/subjects_model.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/chapters_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';

import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_search.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

part '../Widgets/academic_year.dart';

part '../Widgets/subjects_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return GetBuilder<SubjectsController>(
      init: SubjectsController(),
      builder: (_) => BaseScaffold(
        backgroundColor: AppColors.scaffoldBackGround,
        appBar: AppBars.appBarHome(
          bNBIndex: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.ESH(),
            Padding(
              padding: AppPadding.paddingScreenSH36,
              child: SearchTextField(
                  node: node,
                  enable: false,
                  onComplete: () {},
                  hint: 'Search_lecture_name'),
            ),
            20.ESH(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AcademicYearFilter(controller: _),
                  20.ESH(),
                  _SubjectsList(controller: _),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
