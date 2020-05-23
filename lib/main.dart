import 'package:flutter/material.dart';
import 'package:tienda/cuenta.dart';
import 'package:tienda/inicio.dart';
import 'package:tienda/lista.dart';
import 'package:tienda/registro.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: tienda(),
    );
  }
}
class Areacolor extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.greenAccent;

    final Rect rect = Rect.fromLTWH(0, 0, size.width * 0.25, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


class tienda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: Areacolor(),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              appBar(context),
              contenedor(context),
              boton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appBar(BuildContext context){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      MaterialButton(
        onPressed: (){},
        child: Icon(Icons.arrow_back,
          color: Colors.white,
          size: 32.0,),
      ),
      SizedBox(width: 48,),
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 16,),
            Text("Nombre del Producto",
              style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 14,
              ),)
          ],
        ),
      ),

    ],
  );
}

Widget contenedor(BuildContext context){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 32, bottom: 32),
      child: Row(
        children: <Widget>[
          Container(
            width: 140,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 32,top: 50,bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text("Aqui iria la descripcion del Producto",
                          style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 20.0,
                          )),
                    ),

                    Divider(),
                    Expanded(
                      child: Container(),
                    ),
                    CustomPaint(
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        color: Colors.yellowAccent,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text("\$ 250",
                              style: Theme.of(context).textTheme.headline.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 10,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    ),
  );

}

Widget boton(){
  return Container(
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        )
    ),
    child: FlatButton(
      onPressed: () {},
      child: Text("ADD TO CART",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          letterSpacing: 10,
        ),),
    ),

  );
}