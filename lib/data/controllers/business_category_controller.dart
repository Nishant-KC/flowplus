import 'package:get/get.dart';

class BusinessCategoryController extends GetxController {
  final selectedCategories = [].obs;

  addOrRemoveCategory(var category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.value.remove(category);
      selectedCategories.value = selectedCategories.value.toSet().toList();
    } else {
      selectedCategories.value.add(category);
      selectedCategories.value = selectedCategories.value.toSet().toList();
    }
  }
}
