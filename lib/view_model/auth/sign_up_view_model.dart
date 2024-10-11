import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swd_mobile_app_test/view/screens/authentication/create_account_screen.dart';
import 'package:swd_mobile_app_test/view/screens/authentication/verify_email_screen.dart';

final signupViewModel = ChangeNotifierProvider((ref) => SignupViewModel());

class SignupViewModel extends ChangeNotifier {
  final signupFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _referalCodeController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get referalCodeController => _referalCodeController;
  bool get obscurePass => _obscurePass;
  bool _obscurePass = true;
  int _currentPage = 0;

  int get currentPage => _currentPage;

  final List<Widget> _signUpScreens = [
    CreateAccountScreen(),
    VerifyEmailScreen(),
  ];
  List<Widget> get signupScreens => _signUpScreens;
  void onPageChange({required int newPage}) {
    _currentPage = newPage;
    notifyListeners();
  }

  void setPageViewPageToNextPage() {
    _currentPage = 1;
    notifyListeners();
  }

  togglePassWordVisibility() {
    _obscurePass = !_obscurePass;
    notifyListeners();
  }
}
