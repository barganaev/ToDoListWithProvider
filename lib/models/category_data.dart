import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/category.dart';
import 'dart:collection';

class CategoryData extends ChangeNotifier {
  List<iCategory> _categories = [
    iCategory(category: 'All'),
    iCategory(category: 'Travel'),
    iCategory(category: 'Study'),
    iCategory(category: 'Relax'),
    iCategory(category: 'Work'),
  ];

  UnmodifiableListView<iCategory> get categories {
    return UnmodifiableListView(_categories);
  }

  int get categoryCount {
    return _categories.length;
  }

  void addCategory(String newCategoryTitle) {
    final category = iCategory(category: newCategoryTitle);
    _categories.add(category);
    notifyListeners();
  }

  void updateCategory(iCategory category) {
    category.iToggleDone();
    notifyListeners();
  }

  void deleteCategory(iCategory category) {
    _categories.remove(category);
    notifyListeners();
  }
}
