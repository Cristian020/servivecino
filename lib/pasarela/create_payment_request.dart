import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_ui_kit/screens/payment_fail.dart';
import 'package:restaurant_ui_kit/screens/payment_success.dart';
import 'package:restaurant_ui_kit/util/const.dart';

String _paymentMethod;

Future<http.Response> createPaymentRequest() async {
  Constants().validatePaymentMethod().then((value) => {_paymentMethod = value});
  final http.Response response = await http.post(
    'https://stag.wallet.tpaga.co/merchants/api/v1/payment_requests/create',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //este header se debe consumir en todos igual
      'Authorization': 'Basic bWluaWFwcG1hLW1pbmltYWw6YWJjMTIz',
    },
    body: jsonEncode(<String, String>{
      //Cuerpo de la peticion
      "cost": "12000", //monto de la compra
      "purchase_details_url":
          "https://google.com", //podemos regdirigir a una url
      "idempotency_token":
          "0e5d2e44-c9rthtfjityikyuio786sxryhdrtujtfyikgy7846557-4cc0-a529-332322fb10ww", //este token lo debemos generar nuevo siempre
      "order_id": "348820", //esta orden se debe generar nueva siempre
      "terminal_id": "sede_45", //esto no importa
      "purchase_description":
          "Compra en Tienda X", //esto puede ser el nombre del servicio
      "user_ip_address": "61.1.224.56", //esto no importa realmente
      "expires_at":
          "2058-11-05T20:10:57.549653+00:00" //este dato debe ser siempre una fecha a futuro en ese formato asi que podriamos dejar eso asi
    }),
  );

  if (response.statusCode == 201) {
    //Aca que hacemos en caso de tener 201 la creacion del customer es exitosa y continuamos
    //Nos debe responder algo similar a esto para redirigir a la otra app de billetera:
    //"tpaga_payment_url": "https://w.tpaga.co/eyJtIjp7Im8iOiJQUiJ9LCJkIjp7InMiOiJtaW5pbWFsLW1hIiwicHJ0IjoicHItYzQ5ZmM2NmI1NDJiYjE4NDRjN2RkNmJmNWZlMGRlNzBhMTkxOTFiZGY3MWVhZDk2YjRkZDQyNTVkZWFjMDY5Zjg3NWZiNGFmIn19",
    PagoExitoso();
  } else {
    PagoRechazado();
    throw Exception('Failed to create');
  }
}
