import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagoExitoso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrangeAccent[400]),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Icon(Icons.done_outline_rounded,
                size: 60, color: Colors.lightGreenAccent[700]),
            SizedBox(height: 10),
            Text("¡PAGO EXITOSO!",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Colors.lightGreenAccent[700],
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1))),
            Text("\$30.000",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Colors.lightBlue[900],
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1))),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Información Basica",
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
                Text("Numero de transacción",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
                SizedBox(width: 80),
                Text("PWD-123034",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Fecha y hora",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
                SizedBox(width: 150),
                Text("29-09-2020 18:23",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Medio de pago",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
                SizedBox(width: 137),
                Text("Visa",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Tarjeta",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
                SizedBox(width: 190),
                Text("***875",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Descripción",
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
            SizedBox(height: 30),
            Row(
              children: [
                Text("Total:",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.lightBlue[900],
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1))),
                SizedBox(width: 190),
                Text("\n30.000",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w500))),
              ],
            ),
            SizedBox(height: 30),
            ButtonTheme(
              minWidth: double.infinity,
              child: MaterialButton(
                color: Colors.lightGreenAccent[700],
                onPressed: () {},
                child: Text("Cerrar",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
