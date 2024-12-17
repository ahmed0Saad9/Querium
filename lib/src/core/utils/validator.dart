import 'package:get/get.dart';

String? urlValidator(String? text) {
  if (text!.isNotEmpty) {
    if (!text.contains('http') && !text.contains("://")) {
      return 'Must_enter_Valid_URL'.tr;
    } else {
      return null;
    }
  } else {
    return 'Must_enter_URL'.tr;
  }
}

String? nationalIdValidator(String? text) {
  if (text!.isNotEmpty) {
    if (!text.contains('@')) {
      return 'يجب ادخال بريد الكترني صحيح';
    } else {
      return null;
    }
  } else {
    return 'يجب عليك ادخال البريد الالكترني';
  }
}

String? emailValidator(String? text) {
  if (text!.isNotEmpty) {
    if (!text.contains('@')) {
      return 'validation_email_field'.tr;
    } else {
      return null;
    }
  } else {
    return 'validation_empty_field'.tr;
  }
}

String? phoneValidator(String? text) {
  if (text!.isNotEmpty) {
    if(text.startsWith('0') && text.length==11) {
      return null;
    } else {
      return 'يجب ادخال رقم هاتف صحيح';
    }
    return null;
  } else {
    return 'يجب عليك ادخال رقم هاتف';
  }
}

String? passwordValidator(String? text) {
  if (text!.isNotEmpty) {
    if (text.length >8) {
      return null;
    } else {
      return 'validation_password'.tr;
    }
  } else {
    return 'validation_empty_field'.tr;
  }
}

String? confirmPasswordValidator(String? text, String? oldPassword) {
  if (text!.isNotEmpty) {
    if (text != oldPassword) {
      return 'Both_passwords_must_match'.tr;
    } else {
      return null;
    }
  } else {
    return 'validation_empty_field'.tr;
  }
}

String? emptyValidator(String? text, {String error = ''}) {
  if (text!.isEmpty) {
    return 'validation_empty_field'.tr;
  } else {
    return null;
  }
}
