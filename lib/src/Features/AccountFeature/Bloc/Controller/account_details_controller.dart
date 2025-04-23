import 'package:get/get.dart';
import 'package:querium/src/Features/AccountFeature/Bloc/Model/account_details_model.dart';

class AccountDetailsController extends GetxController {
  AccountDetailsModel accountDetails =
    const AccountDetailsModel(
        name: 'ahmed saad',
        email: 'ahmed@gmail.com',
        nationalID: '30401198800537',
        idOfCollege: '12345',
        password: '123456789aA@');

}
