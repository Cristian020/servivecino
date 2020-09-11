import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:pattern_formatter/pattern_formatter.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "Venta",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(height: 30),

           //Nombre del Servicio
           Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child:TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Titulo para el servicio",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ) ,
            ), 
          ),

          //Descripcion
           Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child:TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Dirección",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
              ) ,
            ), 
          ),

          //Celular
          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child:TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: "Celular",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.phone,
              ) ,
            ), 
          ),

          //Precio
           Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child:TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Precio",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
              ) ,
            ), 
          ),

          //Descripcion
           Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child:TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Descripción",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 7,
              ) ,
            ), 
          ), 

          //Boton Guardar
          ButtonBar(
            children: <Widget>[

              FlatButton(
                child: Text('Guardar'),
                color: Colors.orange[900],
                onPressed: () {},
              ),
            ],
          ),

          /*CupertinoButton(
            color: Colors.orange[900],
            child: Text('Vender'),
            onPressed: (){
              showCupertinoDialog(
                context: context, 
                builder: (BuildContext context){
                  return CupertinoAlertDialog(
                    title: Text('Venta'),
                    content: Text('Seguro que desea hacer la venta?'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('Cancelar'),
                      )
                    ],
                  )
                }
            },
          ),*/
          ],
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}