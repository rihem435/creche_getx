import 'dart:convert';

import 'package:app/core/networking/app_url.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/models/list_children_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final dio = Dio();
  ListChildrenModel? listChildrenModel;

  getChildrenByParent() async {
    try {
      var response = await dio
          .get("${AppUrl.getEnfantsByIdParentUrl}${AppStorage.readId()}");

      if (response.statusCode == 200) {
        listChildrenModel = response.data
            .map((json) => ListChildrenModel.fromJson(json))
            .toList();
        print('list enfants=======================>$listChildrenModel');
        return listChildrenModel;
      }
    } catch (e) {
      print("error=============>$e");
    }
  }
}
