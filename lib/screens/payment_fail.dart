import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagoRechazado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepOrangeAccent[400]),
        body: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[
              Icon(Icons.cancel_outlined, size: 60, color: Colors.red),
              SizedBox(height: 10),
              Text("PAGO RECHAZADO",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1))),
              SizedBox(height: 40),
              Text("Intentalo de nuevo",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Colors.lightBlue[900],
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1))),
              SizedBox(height: 40),
              Row(
                children: [
                  Text("Detalles",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.lightBlue[900],
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1)))
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                              fontWeight: FontWeight.w500)))
                ],
              ),
              SizedBox(height: 200),
              ButtonTheme(
                minWidth: double.infinity,
                child: MaterialButton(
                  color: Colors.cyan,
                  onPressed: () {},
                  child: Text("Cerrar",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500))),
                ),
              )
            ])));
  }
}
