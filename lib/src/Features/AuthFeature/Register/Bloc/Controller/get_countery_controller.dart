import 'package:flutter/material.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Model/nationality_model.dart';
import 'package:querium/src/Features/AuthFeature/Register/Bloc/Repo/get_cities_repo.dart';
import 'package:querium/src/core/constants/app_assets.dart';
import 'package:querium/src/core/services/Base/base_controller.dart';
import 'package:querium/src/core/services/Network/network_exceptions.dart';
import 'package:querium/src/core/services/services_locator.dart';

class GetCitiesController extends BaseController<GetCountriesRepository> {
  final List<int> idsSelectedLocal;

  GetCitiesController({required this.idsSelectedLocal});

  @override
  // TODO: implement repository
  get repository => sl<GetCountriesRepository>();

  TextEditingController searchController = TextEditingController();

  final List<CountryModel> _countries = [];

  List<CountryModel> get countries => _countries;

  Future<void> getCities() async {
    _countries.clear();
    reInitPagination();
    showLoading();
    update();

    var result = await repository!.getCities(
      pageNum: page,
      keySearch: searchController.text,
    );

    result.when(success: (List<CountryModel> countries) {
      incrementPageNumber(countries.isNotEmpty);
      _countries.addAll(countries);
      doneLoading();
      update();
    }, failure: (NetworkExceptions error) {
      errorLoading();
      status = actionNetworkExceptions(error);
      update();
    });
  }

  Future<void> getMoreCities() async {
    paginationLoading = true;
    update();
    var result = await repository!.getCities(
      pageNum: page,
      keySearch: searchController.text,
    );
    paginationLoading = false;
    update();
    result.when(success: (List<CountryModel> countries) {
      printDM("countries is $countries");
      incrementPageNumber(countries.isNotEmpty);
      _countries.addAll(countries);
      update();
    }, failure: (NetworkExceptions error) {
      status = actionNetworkExceptions(error);
      update();
    });
  }

  // For Multi Only
  List<CountryModel> _countrySelected = [];

  List<CountryModel> get countrySelected => _countrySelected;

  void selectCountries(CountryModel country) {
    if (_countrySelected.contains(country)) {
      _countrySelected.remove(country);
    } else {
      _countrySelected.add(country);
    }
    update();
  }

  void _passData() {
    if (_countries.isNotEmpty) {
      for (var item in idsSelectedLocal) {
        int index = _countries.indexWhere((element) => element.id == item);
        _countrySelected.add(_countries[index]);
        update();
      }
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getCities();
    _passData();
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // searchController.dispose();
  }
}
