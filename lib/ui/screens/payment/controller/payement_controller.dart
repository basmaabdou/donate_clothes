// controllers/payment_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentController extends GetxController {
  var paymentToken = ''.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPaymentToken();
  }

  Future<void> fetchPaymentToken() async {
    isLoading.value = true;
    errorMessage.value = '';
    print(paymentToken);
    try {
      final response = await http.get(
        Uri.parse('https://donation-system-utjy.onrender.com/payment/donate'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        paymentToken.value = data['token'];
      } else {
        errorMessage.value =
            'Failed to load payment token: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
