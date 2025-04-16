import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/controller/subjects_category_controller.dart';
import 'package:querium/src/Features/HomeFeature/Bloc/model/subjects_category_model.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/chapters_screen.dart';
import 'package:querium/src/Features/SettingsFeature/UI/screens/settings_screen.dart';
import 'package:querium/src/GeneralWidget/Widgets/Cards/card_avatar_image.dart';

import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/GeneralWidget/Widgets/Text/custom_text.dart';
import 'package:querium/src/GeneralWidget/Widgets/TextFields/text_field_search.dart';
import 'package:querium/src/GeneralWidget/Widgets/buttons/button_default.dart'
    as BM;
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/services/svg_widget.dart';
import 'package:querium/src/core/utils/extensions.dart';
import 'package:querium/src/core/utils/storage_util.dart';

part '../Widgets/top_home_widget.dart';
part '../Widgets/subjects_category.dart';
part '../Widgets/lecture_list.dart';
part '../Widgets/history_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return BaseScaffold(
        backgroundColor: AppColors.scaffoldBackGround,
        body: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopHomeWidget(),
              28.ESH(),
              Padding(
                padding: AppPadding.paddingScreenSH36,
                child: SearchTextField(
                    node: node,
                    enable: false,
                    onComplete: () {},
                    hint: 'Search_lecture_name'),
              ),
              30.ESH(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const _SubjectsCategory(),
                      20.ESH(),
                      const _LectureList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
