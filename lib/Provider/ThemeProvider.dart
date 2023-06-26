import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool isdark = false;
  void Themechanger() {
    isdark = !isdark;
    notifyListeners();
  }
}
