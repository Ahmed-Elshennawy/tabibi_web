// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:tabibi_app/api/auth_service.dart';
// import 'package:tabibi_app/widgets/consts.dart';

// class StripeService {
//   StripeService._();
//   static final StripeService instance = StripeService._();

//   final AuthService _authService = AuthService();

//   Future<void> makePayment(int amount, Map<String, dynamic> cardDetails) async {
//     try {
//       final String currency = 'usd';
//       final paymentMethodId = await _createPaymentMethod(cardDetails);

//       if (paymentMethodId != null) {
//         final paymentIntent =
//             await _createPaymentIntent(amount, currency, paymentMethodId);
//         final clientSecret = paymentIntent!['client_secret'];
//         await _authService.setPaymentMethod(paymentMethodId);
//       } else {
//         throw Exception('Failed to create payment method');
//       }
//     } catch (e) {
//       log('Error making payment: $e');
//       throw Exception('Failed to make payment: $e');
//     }
//   }

//   Future<String?> _createPaymentMethod(Map<String, dynamic> cardDetails) async {
//     try {
//       final Dio dio = Dio();
//       Map<String, dynamic> data = {
//         'type': 'card',
//         'card': {
//           'name': cardDetails['cardHolderName'],
//           'number': cardDetails['cardNumber'],
//           'exp_month': cardDetails['expMonth'],
//           'exp_year': cardDetails['expYear'],
//           'cvc': cardDetails['cvv'],
//         },
//       };

//       log('Sending card details to Stripe: $data');
//       var response = await dio.post(
//         'https://api.stripe.com/v1/payment_methods',
//         data: data,
//         options: Options(
//           contentType: Headers.formUrlEncodedContentType,
//           headers: {
//             'Authorization': "Bearer $stripeSecretKey",
//             "Content-Type": "application/x-www-form-urlencoded",
//           },
//         ),
//       );
//       if (response.data != null) {
//         log('Payment method created: \n${response.data}');
//         return response.data['id']; // Return the payment method ID
//       }
//     } catch (e) {
//       log('Error creating payment method: $e');
//       throw Exception('Failed to create payment method: $e');
//     }
//     return null;
//   }

//   Future<Map<String, dynamic>?> _createPaymentIntent(
//       int amount, String currency, String paymentMethodId) async {
//     try {
//       final Dio dio = Dio();
//       Map<String, dynamic> data = {
//         'amount': _calculateAmount(amount),
//         'currency': currency,
//         'payment_method': paymentMethodId,
//         'confirm': true,
//       };
//       var response = await dio.post(
//         'https://api.stripe.com/v1/payment_intents',
//         data: data,
//         options: Options(
//           contentType: Headers.formUrlEncodedContentType,
//           headers: {
//             'Authorization': "Bearer $stripeSecretKey",
//             "Content-Type": "application/x-www-form-urlencoded",
//           },
//         ),
//       );
//       if (response.data != null) {
//         log('Payment intent created: \n${response.data}');
//         return response.data;
//       }
//     } catch (e) {
//       log('Error creating payment intent: $e');
//       throw Exception('Failed to create payment intent: $e');
//     }
//     return null;
//   }

//   int _calculateAmount(int amount) {
//     return amount * 100;
//   }
// }
