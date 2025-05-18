part of '../screens/home_screen.dart';

class _SubjectsCategory extends StatelessWidget {
  const _SubjectsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AcademicYearController>(
      init: AcademicYearController(),
      builder: (controller) => SizedBox(
        height: 45.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppPadding.paddingScreenSH36,
          itemBuilder: (context, index) => _CategoryCard(
            subjectsCategory: controller.academicYearCards[index],
            isSelected: controller.tapIdSelected ==
                controller.academicYearCards[index].id,
            onTapSelected: () =>
                controller.selectTapId(controller.academicYearCards[index].id),
          ),
          itemCount: controller.academicYearCards.length,
          separatorBuilder: (context, index) => 8.ESW(),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final AcademicYearModel subjectsCategory;
  final bool isSelected;
  final VoidCallback onTapSelected;
  const _CategoryCard({
    super.key,
    required this.subjectsCategory,
    required this.isSelected,
    required this.onTapSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapSelected,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.main : AppColors.transparentColor,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: AppColors.main)),
        child: Center(
          child: CustomTextL(
            subjectsCategory.label,
            fontSize: 16.sp,
            color: isSelected ? AppColors.titleWhite : AppColors.main,
            fontWeight: FW.bold,
          ),
        ),
      ),
    );
  }
}
