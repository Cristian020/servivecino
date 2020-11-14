import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/pasarela/tokenize_credit_card.dart';

Future<http.Response> createCustomer() async {
  final http.Response response = await http.post(
    'https://sandbox.tpaga.co/api/customer',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic aDdwZXQ3dGtxOXVwOGNudjFsaG1sOHVwb2I0ZGE4a2M6',
    },
    body: jsonEncode(<String, String>{
      //aca toca reemplazar los datos que estan quemados
      "email": "lsuarez@tpaga.co",
      "firstName": "Luis",
      "gender": "M",
      "lastName": "Suarez",
      "legalIdNumber": "1010101010",
      "merchantCustomerId": "0",
      "phone": "1234567"
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la creacion del customer es exitosa y continuamos
    createTokenize();
  } else {
    throw Exception('Failed to create');
  }
}
