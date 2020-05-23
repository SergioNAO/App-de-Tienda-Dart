import 'package:tienda/main.dart';
import 'package:tienda/cuenta.dart';
import 'package:flutter/material.dart';
import 'package:tienda/lista.dart';
import 'package:tienda/registro.dart';
lista l = new lista();
class Login extends StatelessWidget{
  Widget correo(){
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: TextFormField(decoration: InputDecoration(hintText: "Usuario"),),
    );
  }

  Widget contrasena(){
    return Padding(
      padding: const EdgeInsets.only(top:40.0),
      child: TextFormField(decoration: InputDecoration(hintText: "Contraseña"),
        obscureText: true,),
    );
  }

  Widget boton(BuildContext context){

    return Container(
        padding: EdgeInsets.only(top: 50),
        child: RaisedButton(child: Text("Entrar"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => lista()));

          },)
    );
  }

  Widget CrearCuenta (BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: new InkWell(child: new Text("Registrate aqui!!",
        textAlign: TextAlign.right,
        style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: Colors.blue),),
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroWidget()));
          }

      ),
    );

  }

  Widget Divisor(){
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Row(children: <Widget>[
        Expanded(child:Divider(height: 1,)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text("O"),
        ),
        Expanded(child:Divider(height: 1,)),
      ],),
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
            children: <Widget>[
              Image.asset('assets/leon.png',
                  height: 200),
              correo(),
              contrasena(),
              boton(context),
              CrearCuenta(context),
              //Divisor(),
            ]),
      ),
    );
  }
}
