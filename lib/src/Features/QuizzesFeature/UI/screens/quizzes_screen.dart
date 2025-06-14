import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Controller/quizzes_controller.dart';
import 'package:querium/src/Features/QuizzesFeature/UI/widget/quizzes_List.dart';
import 'package:querium/src/Features/QuizzesFeature/UI/widget/quizzes_category_widget.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/core/constants/color_constants.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      init: QuizzesController(),
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackGround,
          image: DecorationImage(
              image: AssetImage('assets/images/QuizBG.png'),
              scale: 2.5,
              alignment: Alignment.topLeft),
        ),
        child: BaseScaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBars.appBarDefault(
              title: 'My_Quizzes',
              isBack: false,
            ),
            body: Column(
              children: [
                30.ESH(),
                QuizzesCategoryWidget(controller: _),
                16.ESH(),
                QuizzesList(
                  controller: _,
                )
              ],
            )),
      ),
    );
  }
}
