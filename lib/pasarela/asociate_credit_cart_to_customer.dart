import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/util/const.dart';

String _customer;
String paymentMethod;
String paymentMethodType;
String paymentMethodLastFour;

@deprecated
Future<http.Response> createAsociate(String token) async {
  Constants().validateCustomer().then((value) => {_customer = value});
  final http.Response response = await http.post(
    'https://sandbox.tpaga.co/api/customer/' + _customer + '/credit_card_token',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic aDdwZXQ3dGtxOXVwOGNudjFsaG1sOHVwb2I0ZGE4a2M6',
    },
    body: jsonEncode(<String, String>{
      //aca toca reemplazar los datos que estan quemados
      "skipLegalIdCheck": "false",
      "token": token
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la asociacion del customer y la cc es exitosa y continuamos
    final responseJson = json.decode(response.body)['id'];
    paymentMethod = responseJson;
    print("Este el el json de response: " + responseJson.toString());
    Constants().setPaymentMethod(paymentMethod);

    //Guardamos localmente la fanquicia
    final responseJsonType = json.decode(response.body)['type'];
    paymentMethodType = responseJsonType;
    print("Este el el json de response: " + responseJson.toString());
    Constants().setPaymentMethodType(paymentMethodType);

    //Guardamos localmente los ultimos 4
    final responseJsonLastFour = json.decode(response.body)['lastFour'];
    paymentMethodLastFour = responseJsonLastFour;
    print("Este el el json de response: " + responseJson.toString());
    Constants().setPaymentMethodLastFour(paymentMethodLastFour);
  } else {
    throw Exception('Failed to create');
  }
}
