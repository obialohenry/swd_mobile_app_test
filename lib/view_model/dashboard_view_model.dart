import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModel = ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onItemClicked(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setIndexToHome() {
    _selectedIndex = 0;
    notifyListeners();
  }
}
