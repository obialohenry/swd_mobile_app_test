import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinViewModel = ChangeNotifierProvider((ref) => SigninViewModel());

class SigninViewModel extends ChangeNotifier {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get obscurePass => _obscurePass;
  bool _obscurePass = true;
  togglePassWordVisibility() {
    _obscurePass = !_obscurePass;
    notifyListeners();
  }
}
