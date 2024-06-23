// views/payment_view.dart
import 'package:donate_clothes/ui/screens/payment/controller/payement_controller.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(backgroundColor: controller2.app,));
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.paymentToken.value.isNotEmpty) {
          final url = 'https://accept.paymob.com/api/acceptance/iframes/783534?payment_token=${controller.paymentToken.value}';
          return WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          );
        } else {
          return Center(child: Text('Unknown error occurred.'));
        }
      }),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => controller.fetchPaymentToken(),
              child: Icon(Icons.refresh, color: Colors.white),
              backgroundColor: controller2.app,
              mini: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 25),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: Colors.white),
                backgroundColor: controller2.app,
                mini: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
