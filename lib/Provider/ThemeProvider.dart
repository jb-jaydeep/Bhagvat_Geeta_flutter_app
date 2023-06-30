import 'package:flutter/cupertino.dart';

import '../Model/JsonData.dart';

class ThemeProvider extends ChangeNotifier {
  bool isdark = false;
  void Themechanger() {
    isdark = !isdark;
    notifyListeners();
  }
}
