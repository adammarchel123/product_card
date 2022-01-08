import 'package:flutter/material.dart';

class ProductState with ChangeNotifier {
  int _pcs = 0;
  int get pcs => _pcs;
  set pcs(int newPcs) {
    _pcs = newPcs;
    notifyListeners();
  }
}
