import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tienda/cuenta.dart';
import 'package:tienda/inicio.dart';
import 'package:tienda/main.dart';

class lista  extends StatefulWidget{
  _listaState createState() => _listaState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}

class _listaState extends State<lista> {
  List<item> data = null;
  Datos d = new Datos();

//Color backroundColor = Colors.white;

  @override
  Widget build(BuildContext context){
    if( data == null){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }



    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('MENU'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Cuenta'),

              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Datos()));

              },
            ),
            ListTile(
              title: Text('Salir'),

              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

              },
            )
          ],
        ),
      ),

      //backgroundColor: backroundColor,
      body: ListView(

        children: <Widget>[
          AppBar( title: Text('Productos', textAlign: TextAlign.center,), actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),

            ),
            //enum WhyFarther { harder, smarter, selfStarter, tradingCharter },
            //PopupMenuButton(

            //),

          ],),
          for(item board in data)
            ItemWidget(

              title: "Producto 1",
              imagenPath: board.imagePath,
              precio: "\$250",
              colors: board.colors,
                         ),

        ],
      ),

    );
  }

  @override
  void initState() {
    super.initState();

    _initializeColors().then((list) {
      setState((){
        data = list;
        //backroundColor = data.first.colors.color;
      });
    });
  }

  Future<List<item>> _initializeColors() async{
    var images = ["1.png","2.png","3.png","4.png","5.png","6.png"];

    List<item> list = [];

    for(String image in images) {
      String imagePath = "assets/$image";
      PaletteGenerator colors = await PaletteGenerator.fromImageProvider(
          AssetImage(imagePath));
      list.add(item(imagePath, colors.dominantColor));
    }
    return list;
  }
}

class item{
  final String imagePath;
  final PaletteColor colors;

  item(this.imagePath, this.colors);
}


class ItemWidget extends StatelessWidget{
  final String title;
  final String imagenPath;
  final String precio;
  final PaletteColor colors;

  const ItemWidget({Key key, this.title, this.imagenPath, this.precio, this.colors}) : super(key: key);

  Widget build(BuildContext context){
    return Container(
      color: colors.color,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.bodyTextColor,
                    letterSpacing: 10,
                    fontWeight: FontWeight.w700,
                  ),)),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Text(precio,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.bodyTextColor,
                    letterSpacing: 10,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            RotatedBox(
              quarterTurns: 3,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    //boxShadow: [
                    //BoxShadow(color: Colors.black,
                    //blurRadius: 110
                    //),
                    //]
                  ),
                  child: Center(child: Image.asset(imagenPath)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
