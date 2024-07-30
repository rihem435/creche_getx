import 'package:app/core/networking/app_url.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/models/list_children_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeController extends GetxController {
  final dio = Dio();
  List<ListChildrenModel>? listChildrenModel;
  Future<List<ListChildrenModel>?> getChildrenByParent() async {
    try {
      var response = await dio
          .get("${AppUrl.getEnfantsByIdParentUrl}${AppStorage.readId()}");
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        listChildrenModel = responseData
            .map((json) => ListChildrenModel.fromJson(json))
            .toList();
        print('list enfant ================>$listChildrenModel');
        return listChildrenModel;
      }
    } catch (e) {
      print("error=========>$e");
    }
    return null;
  }

  String selectedDate = "";
  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      selectedDate = args.value.toString().substring(0, 10);
      //selectedDate.text = args.value.toString().substring(0, 10);
    }
    update();
  }
}
