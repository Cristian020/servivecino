import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/pasarela/asociate_credit_cart_to_customer.dart';

Future<http.Response> createTokenize() async {
  final http.Response response = await http.post(
    'https://sandbox.tpaga.co/api/tokenize/credit_card',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic aDdwZXQ3dGtxOXVwOGNudjFsaG1sOHVwb2I0ZGE4a2M6',
    },
    body: jsonEncode(<String, String>{
      //aca toca reemplazar los datos que estan quemados
      "cardHolderName": "Luis S.",
      "expirationMonth": "12",
      "expirationYear": "2030",
      "primaryAccountNumber": "4111111111111111"
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la creacion de la tarjeta es exitosa y continuamos
    createAsociate();
  } else {
    throw Exception('Failed to create');
  }
}
