import 'package:app/controllers/home_controller.dart';
import 'package:app/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Payment',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(children: [
          Image.asset(
            "assets/images/payment.png",
            width: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  10,
                ),
                bottomRight: Radius.circular(
                  10,
                ),
                topLeft: Radius.circular(
                  10,
                ),
                topRight: Radius.circular(
                  10,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey[300],
                child: const Icon(
                  Icons.money,
                ),
              ),
            ),
            title:
                const Text("Montant: 500 dt", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  10,
                ),
                bottomRight: Radius.circular(
                  10,
                ),
                topLeft: Radius.circular(
                  10,
                ),
                topRight: Radius.circular(
                  10,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey[300],
                child: const Icon(
                  Icons.money,
                ),
              ),
            ),
            title: const Text("Status: Unpaid", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<HomeController>(builder: (controller) {
            return Column(
              children: [
                InkWell(
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.only(left: 18, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: controller.selectedDate.isEmpty
                        ? const Text(
                            "selectionner date",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )
                        : Text(
                            controller.selectedDate.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            height: 250,
                            child: Card(
                                child: SfDateRangePicker(
                              showActionButtons: true,
                              onSubmit: (p0) {
                                print('value=============>$p0');
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                              cancelText: "fermer",
                              confirmText: "confirmer",
                              onSelectionChanged: controller.onSelectionChanged,
                              selectionMode:
                                  DateRangePickerSelectionMode.single,
                            )));
                      },
                    );
                  },
                ),
              ],
            );
          }),
        ]),
      ),
    );
  }
}
