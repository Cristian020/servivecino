import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/util/const.dart';

String _customer;

Future<http.Response> createCustomer(String email, String name, String lastName,
    String document, String telefono) async {
  final http.Response response = await http.post(
    'https://sandbox.tpaga.co/api/customer',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic aDdwZXQ3dGtxOXVwOGNudjFsaG1sOHVwb2I0ZGE4a2M6',
    },
    body: jsonEncode(<String, String>{
      //aca toca reemplazar los datos que estan quemados
      "email": email,
      "firstName": name,
      "lastName": lastName,
      "legalIdNumber": document,
      "phone": telefono
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la creacion del customer es exitosa y continuamos
    final responseJson = json.decode(response.body)['id'];
    _customer = responseJson;
    print("Este el el json de response: " + responseJson.toString());
    Constants().setCustomer(_customer);
  } else {
    throw Exception('Failed to create');
  }
}
