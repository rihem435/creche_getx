import 'package:app/core/networking/app_url.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/models/list_children_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeController extends GetxController {
  final dio = Dio();
  List<ListChildrenModel>? listChildrenModel;
  Future<List<ListChildrenModel>?> getChildrenByParent(String url) async {
    try {
      var response = await dio.get(url);
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

  String? selectedPaymentMode;
  void updateSelectedPaymentMode(String? newValue) {
    selectedPaymentMode = newValue;
    update();
  }

  void viderDate() {
    selectedDate = "";
    update();
  }

  Future<void> savePayment() async {
    if (selectedDate != null && selectedPaymentMode != null) {
      try {
        var response = await dio.post(AppUrl.payment, data: {
          "parentId": AppStorage.readId(),
          "date": selectedDate,
          "paymentMode": selectedPaymentMode,
          "amount": 500,
        });
        if (response.statusCode == 200) {
          print('Paiement enregistré avec succès');
        } else {
          print('Échec du paiement');
        }
      } catch (e) {
        print("Erreur du paiement=======>: $e");
      }
    } else {
      print("La date et le mode de paiement doivent être sélectionnés");
    }
  }
}
