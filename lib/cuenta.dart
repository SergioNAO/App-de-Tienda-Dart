import 'package:flutter/material.dart';
import 'package:tienda/main.dart';

class Datos extends StatelessWidget{
  @override


  Widget p1(){
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Image.asset("assets/leon.png", width: 100, height: 100,),
          ),),
          Expanded(child: Column(children: <Widget>[
            Text("SNAO", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            Text("Sergio \n Ortiz", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.6)),),
            Padding(
              padding: const EdgeInsets.only(top:20.0,left: 10),
              child: Text("Editar Perfil", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),),
            ),
          ],)),
        ],
      ),
    );
  }

  Widget info (){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(children: <Widget>[
              Text("Estado:  ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text("San Luis Potosi"),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(children: <Widget>[
              Text("Ciudad:  ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text("Ciudad Valles"),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(children: <Widget>[
              Text("Direccion:  ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text("Colonia 18 de Marzo"),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(children: <Widget>[
              Text("Telefono:  ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text("481-107-3023"),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(children: <Widget>[
              Text("E-mail:  ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text("sergioortiz@gmail.com"),
            ],),
          ),
        ],
      ),
    );
  }

  Widget compras(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Column(children: <Widget>[
            Image.asset("assets/1.png", height: 90,)
          ],),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15),
              child: Column(
                children: <Widget>[
                  Text("Fecha de Compra", style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("27-05-2019"),
                  ),
                  Text("Informacion de Compra",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Termo de color verde hecho\n de acero inoxidable", textAlign: TextAlign.center,),
                ],
              ),
            ),
            widthFactor: 1.6,
          ),
        ],
      ),
    );
  }

  Widget listacompras(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: RaisedButton(child: Text("Todas las Compras",textAlign: TextAlign.center, style: TextStyle(color: Colors.blue),),
          onPressed: (){print("funciona");},)
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            AppBar(title: Text("Perfil"), backgroundColor: Colors.blue),
            p1(),
            AppBar(automaticallyImplyLeading: false ,title: Text("Informacion"), backgroundColor: Colors.blue,),
            info(),
            AppBar(automaticallyImplyLeading: false ,title: Text("Compras"), backgroundColor: Colors.blue,),
            compras(),
            listacompras(),
          ],
        ),
      ),
    );
  }

}
