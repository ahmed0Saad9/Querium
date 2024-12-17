import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/company_category_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Repo/get_company_categories_repo.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class GetCompanyCategoriesController
    extends BaseController<GetCompanyCategoriesRepository> {
  @override
  // TODO: implement repository
  get repository => sl<GetCompanyCategoriesRepository>();

  final List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  Future<void> getCompanyCategories() async {
    _categories.clear();
    reInitPagination();
    showLoading();
    update();
    var result = await repository!.getCompanyCategories(
      pageNum: page,
    );
    result.when(success: (BaseCategoryModel data) {
      incrementPageNumber(data.companyCategories.isNotEmpty);
      _categories.addAll(data.companyCategories);

      doneLoading();

      update();
    }, failure: (NetworkExceptions error) {
      status = actionNetworkExceptions(error);
      update();
    });
  }

  Future<void> getMoreCompanyCategories() async {
    paginationLoading = true;
    update();
    var result = await repository!.getCompanyCategories(
      pageNum: page,
    );
    paginationLoading = false;
    update();
    result.when(success: (BaseCategoryModel data) {
      incrementPageNumber(data.companyCategories.isNotEmpty);
      _categories.addAll(data.companyCategories);
      update();
    }, failure: (NetworkExceptions error) {
      status = actionNetworkExceptions(error);
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getCompanyCategories();
    super.onInit();
  }
}
