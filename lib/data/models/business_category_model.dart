import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_plus/constants/form_constants.dart';

class BusinessCategoryModel {
  String? categoryName;
  String? categoryImage;

  BusinessCategoryModel({
    this.categoryName,
    this.categoryImage,
  });
  factory BusinessCategoryModel.fromJson(DocumentSnapshot data) {
    Map json = data.data() as Map;
    return BusinessCategoryModel(
      categoryName: json[BusinessCategoryConstants.categoryName],
      categoryImage: json[BusinessCategoryConstants.categoryImage],
    );
  }
}
