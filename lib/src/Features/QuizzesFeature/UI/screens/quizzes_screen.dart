import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:querium/src/Features/QuizzesFeature/Bloc/Controller/quizzes_controller.dart';
import 'package:querium/src/Features/QuizzesFeature/UI/widget/quiz_card.dart';
import 'package:querium/src/GeneralWidget/Widgets/Appbars/app_bars.dart';
import 'package:querium/src/GeneralWidget/Widgets/Other/base_scaffold.dart';
import 'package:querium/src/core/constants/sizes.dart';
import 'package:querium/src/core/utils/extensions.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      init: QuizzesController(),
      builder: (_) => BaseScaffold(
        appBar: AppBars.appBarBack(title: 'My_Quizzes'),
        body: ListView.separated(
          padding: AppPadding.paddingScreenSH22SV22,
          itemBuilder: (context, index) =>
              QuizCard(quizzesModel: _.quizzes[index]),
          separatorBuilder: (context, index) => 10.ESH(),
          itemCount: _.quizzes.length,
        ),
      ),
    );
  }
}
