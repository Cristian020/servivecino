import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/screens/payment_fail.dart';
import 'package:restaurant_ui_kit/screens/payment_success.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String _paymentMethod;

Future<http.Response> createPay() async {
  Constants().validatePaymentMethod().then((value) => {_paymentMethod = value});
  final http.Response response = await http.post(
    'https://sandbox.tpaga.co/api/charge/credit_card',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic aDdwZXQ3dGtxOXVwOGNudjFsaG1sOHVwb2I0ZGE4a2M6',
    },
    body: jsonEncode(<String, String>{
      //aca toca reemplazar los datos que estan quemados
      "amount": "45000",
      "creditCard": _paymentMethod,
      "currency": "COP",
      "description": "Tpaga",
      "installments": "1",
      "orderId": "1001",
      "taxAmount": "150"
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la creacion del customer es exitosa y continuamos
    PagoExitoso();
  } else {
    PagoRechazado();
    throw Exception('Failed to create');
  }
}
