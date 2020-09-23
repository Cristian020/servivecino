import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
//import 'package:pattern_formatter/pattern_formatter.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin<FavoriteScreen> {

  final List<String> _tipos =['Mano de obra','Educación','Tecnología','Transporte','Recreacion','Belleza','Otro'];
  final formKey = GlobalKey<FormState>();
  File _image;
  String urlImage;
  String _tituloServicio;
  String _direccion;
  String _celular;
  String _precio;
  String _descripcion;
  var _categoriaSeleccionada;
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Detalles de la Venta",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[ 
              SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.only(/*bottom: 5.0*/),
                  child: IconButton(
                    alignment: Alignment.bottomRight,
                    icon: Icon(
                      Icons.photo_camera,
                      size: 30.0,
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 2.8,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: (_image!=null)?Image.file(
                      _image,
                      fit: BoxFit.fill,
                      ):Image.asset(
                        "assets/addImage.png",
                      //"https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                      fit: BoxFit.fill,
                      ),
                      
                  ),
                ),

              SizedBox(height: 24.0),
              //Nombre del Servicio
              TextFormField(
                decoration:const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  hintText: "Titulo para el servicio",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                validator: (value){
                  return value.isEmpty ? "El titulo del servicio es requerido": null;
                },
                onSaved: (value){
                  return _tituloServicio=value;
                },
              ),
              
              SizedBox(height: 10.0),

              DropdownButtonFormField(
                items: _tipos.map((value){
                  return DropdownMenuItem(
                    child: Text(
                      value,
                    ),
                    value: value,
                  );
                }).toList(),
                onChanged: (selectAccountType){
                  setState(() {
                    _categoriaSeleccionada =selectAccountType;
                  });
                },
                value: _categoriaSeleccionada,
                isExpanded: false,
                hint: Text(
                  'Categoria'
                ),
                validator: (value){
                  return value == null ? "La categoria es requerida": null ;
                },
                onSaved: (value){
                  return _categoriaSeleccionada=value;
                },
              ),

              SizedBox(height: 10.0),

              //Descripcion
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  hintText: "Dirección",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                validator: (value){
                  return value.isEmpty ? "La dirección es requerida": null;
                },
                onSaved: (value){
                  return _direccion=value;
                },
              ),

              SizedBox(height: 10.0),

              //Celular
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  hintText: "Celular",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 1,
                validator: (value){
                  return value.isEmpty ? "El número de celular es requerido": null;
                },
                onSaved: (value){
                  return _celular=value;
                },
              ),

              SizedBox(height: 10.0),

              //Precio
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  hintText: "Precio por su servicio",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  prefixText: '\$',
                  suffixText: 'COP',
                  suffixStyle: TextStyle(color: Colors.orange)
                ),
                maxLines: 1,
                validator: (value){
                  return value.isEmpty ? "El precio es requerido": null;
                },
                onSaved: (value){
                  return _precio=value;
                },
              ),

              SizedBox(height: 10.0),

              //Descripcion
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  hintText: "Descripción",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                maxLines: 7,
                validator: (value){
                  return value.isEmpty ? "La descripción es requerida": null;
                },
                onSaved: (value){
                  return _descripcion=value ;
                },
              ),

              RaisedButton(
                child: Text(
                    "Realizar venta",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: subirDatosDatabase,
              )
              /*bottomNavigationBar: Container(
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    "Realizar venta",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: validacionFormulario,
                ),
              ),*/
            ],
          ),
        ),
      ),
      
    ); 
  }

  //Obtener imagen
  Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
          print('Image Path $_image');
      });
    }

  //Validar formulario
  bool validacionFormulario(){
    final form=formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  void subirDatosDatabase()async{
    if(validacionFormulario()){
      //Subir imagen
      final StorageReference imagenReferencia = FirebaseStorage.instance.ref().child("Servicio_imagenes");
      var obtenerFechaHoraImagen = DateTime.now();
      final StorageUploadTask subirFotoData = imagenReferencia.child(obtenerFechaHoraImagen.toString()+"jpg").putFile(_image);
      var obtenerUrlImagen = await (await subirFotoData.onComplete).ref.getDownloadURL();
      urlImage = obtenerUrlImagen.toString();
      print("Imagen url: "+urlImage);

      //Subir formulario a DataBase
      subirFormulario(urlImage);

      Navigator.pop(context);
    }
  }

  void subirFormulario(String urlImage) async{
    var fechaActual = DateTime.now();
    var formatoFecha = DateFormat('MMM d, yyyy');
    var formatoHora = DateFormat('EEEE, hh:mm aaa');

    String fecha = formatoFecha.format(fechaActual);
    String hora = formatoHora.format(fechaActual);

    //DatabaseReference ref = FirebaseDatabase.instance.reference();
    var datosFormulario ={
      "Imagen": urlImage,
      "Titulo": _tituloServicio,
      "Categoria": _categoriaSeleccionada,
      "Direccion": _direccion,
      "Celular": _celular,
      "Precio": _precio,
      "Descripcion": _descripcion,
      "Fecha": fecha,
      "Hora" : hora
    };

    await databaseReference.collection("formulario").add(datosFormulario);
    //ref.child("Formulario").push().set(datosFormulario);
  }

  @override
  bool get wantKeepAlive => true;
}
