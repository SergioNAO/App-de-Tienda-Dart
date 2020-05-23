import 'package:flutter/material.dart';
//import 'package:path/path.dart';
//import 'package:tienda/database.dart';
//funciones f = new funciones();

class RegistroWidget extends StatefulWidget{
  @override
  _RegistroWidgetState createSate() => _RegistroWidgetState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegistroWidgetState();
  }



}
class _RegistroWidgetState extends State<RegistroWidget>{
  final Nombres = TextEditingController();
  final Apellidos = TextEditingController();
  final Username = TextEditingController();
  final Email = TextEditingController();
  final contrasena = TextEditingController();


  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    Nombres.dispose();
    Apellidos.dispose();
    Username.dispose();
    Email.dispose();
    contrasena.dispose();
    super.dispose();
  }



  Widget nom(){
    return Padding(
      padding: EdgeInsets.only(top: 30.0,right: 30,left: 30),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Nombres"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField( controller: Nombres ,),
          ),
        ],
      ),
    );
  }

  Widget ap(){
    return Padding(
      padding: EdgeInsets.only(top: 30.0,right: 30,left: 30),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Apellidos"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(controller: Apellidos,),

          ),
        ],
      ),
    );
  }

  Widget user(){
    return Padding(
      padding: EdgeInsets.only(top: 30.0,right: 30,left: 30),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Username"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(controller: Username,),
          ),
        ],
      ),
    );
  }

  Widget email(){
    return Padding(
      padding: EdgeInsets.only(top: 30.0,right: 30,left: 30),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("E-mail"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(controller: Email,),
          ),
        ],
      ),
    );
  }

  Widget password(){
    return Padding(
      padding: EdgeInsets.only(top: 30.0,right: 30,left: 30),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Contraseña"),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(obscureText: true, controller: contrasena,)
            ,
          ),
        ],
      ),
    );
  }

  Widget bot(BuildContext context){
    return Container(
        padding: EdgeInsets.only(top: 50, right: 30, left: 30),
        child: RaisedButton(child: Text("Registrarse", style: TextStyle(color: Colors.blue),),
            onPressed:  (){
              /* var fido = Dog(
                nombre: Nombres.text,
                apellidos: Apellidos.text,
                username:  Username.text,
                email: Email.text,
                contrasena: contrasena.text
            );
              f.insertDog(fido);
            */
              Nombres.clear(); Apellidos.clear(); Username.clear();
              Email.clear(); contrasena.clear();

              return showDialog(context: context,builder: (context){
                return AlertDialog( content: Text('Se ha registrado correctamente'),
                );
              },); }

        )

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            AppBar( actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
              )
            ],),
            Text("Registro",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,),
            nom(),
            ap(),
            user(),
            email(),
            password(),
            bot(context),
          ],
        ),
      ),
    );
  }




}
