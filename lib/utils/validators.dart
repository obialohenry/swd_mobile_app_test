class Validators {
  final mustContainCapital = RegExp('^(?=.*?[A-Z])');
  final mustContainNumber = RegExp('^(?=.*?[0-9])');
  final mustContainCharacter = RegExp(r'^(?=.*?[#?!@$%^&*-])');

  String? validateEmptyTextField(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    }
    return null;
  }
}
