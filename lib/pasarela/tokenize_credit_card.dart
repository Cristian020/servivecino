import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/pasarela/asociate_credit_cart_to_customer.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String _tokenCc;

@deprecated
Future<http.Response> createTokenize(
    String name, String month, String year, String number) async {
  final http.Response response = await http.post(
    'https://sandbox.tpaga.co/api/tokenize/credit_card',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic aDIxZXI2dWo1ZDBibzZiMTJqa2piZTFxNzdhcGg1dHI6',
    },
    body: jsonEncode(<String, String>{
      //aca toca reemplazar los datos que estan quemados
      "cardHolderName": name,
      "expirationMonth": month,
      "expirationYear": "20" + year,
      "primaryAccountNumber": number.trim()
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la creacion de la tarjeta es exitosa y continuamos
    final responseJson = json.decode(response.body)['token'];
    _tokenCc = responseJson;
    print("Este el el json de response: " + responseJson.toString());
    Constants().setTokenCc(_tokenCc);
  } else {
    throw Exception('Failed to create');
  }
}
