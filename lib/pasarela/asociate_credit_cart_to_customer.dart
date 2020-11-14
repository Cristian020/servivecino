import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/pasarela/pay.dart';

String token;

Future<http.Response> createAsociate() async {
  final http.Response response = await http.post(
    'https://sandbox.tpaga.co/api/customer/' + token + '/credit_card_token',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic aDdwZXQ3dGtxOXVwOGNudjFsaG1sOHVwb2I0ZGE4a2M6',
    },
    body: jsonEncode(<String, String>{
      //aca toca reemplazar los datos que estan quemados
      "skipLegalIdCheck": "false",
      "token": "47o1ig9up88g9mo77q8pj18n4cfc3p35"
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la asociacion del customer y la cc es exitosa y continuamos
    createPay();
  } else {
    throw Exception('Failed to create');
  }
}
