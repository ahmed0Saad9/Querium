import 'package:get/get.dart';

String? nameValidator(String? text) {
  if (text!.isNotEmpty) {
    RegExp regex = RegExp('[a-zA-Z]');
    if (regex.hasMatch(text)) {
      if (text.length >= 6 && text.length <= 50) {
        return null;
      } else {
        return 'Minimum 6 letters and maximum 50 letters';
      }
    } else {
      return 'Please enter from a-z only';
    }
  }
  return 'Please enter your name';
}

String? emailValidator(String? text) {
  if (text!.isNotEmpty) {
    if (!text.contains('@')) {
      return 'Please enter a valid Email';
    }
  } else {
    return 'Please enter an Email';
  }
  return null;
}

String? passwordValidator(String? text) {
  if (text!.isNotEmpty) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (text.isEmpty) {
      return null;
    } else {
      if (!regex.hasMatch(text)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }
  return 'Please enter password';
}

String? confirmPasswordValidator(String? text, String? oldPassword) {
  if (text!.isNotEmpty) {
    if (text != oldPassword) {
      return 'The passwords do not match.';
    } else {
      return null;
    }
  } else {
    return 'Please confirm your password';
  }
}

String? idValidator(String? text) {
  if (text!.isEmpty || text.length != 5) {
    return 'your national id must be 5 numbers';
  }
  return null;
}

String? nationalIdValidator(String? text) {
  if (text!.isEmpty || text.length != 16) {
    return 'your national id must be 16 numbers';
  }
  return null;
}

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

String? phoneValidator(String? text) {
  if (text!.isNotEmpty) {
    if (text.startsWith('0') && text.length == 11) {
      return null;
    } else {
      return 'يجب ادخال رقم هاتف صحيح';
    }
  } else {
    return 'يجب عليك ادخال رقم هاتف';
  }
}

// String? passwordValidator(String? text) {
//   if (text!.isNotEmpty) {
//     if (text.length > 8 && text.contains()) {
//       return null;
//     } else {
//       return 'validation_password'.tr;
//     }
//   } else {
//     return 'validation_empty_field'.tr;
//   }
// }

String? emptyValidator(String? text, {String error = ''}) {
  if (text!.isEmpty) {
    return 'validation_empty_field'.tr;
  } else {
    return null;
  }
}
