/*import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
final database = openDatabase(
  // Establecer la ruta a la base de datos. Nota: Usando la función `join` del
  // complemento `path` es la mejor práctica para asegurar que la ruta sea correctamente
  // construida para cada plataforma.
    join(await getDatabasesPath(), 'naturapp.db'),
// Cuando la base de datos se crea por primera vez, crea una tabla para almacenar dogs
    onCreate: (db, version) {
return db.execute(
"CREATE TABLE usuario(nombre TEXT(50), apellidos TEXT(50), username TEXT PRIMARY KEY, email TEXT(50), contrasena TEXT(10))",
);
},
// Establece la versión. Esto ejecuta la función onCreate y proporciona una
// ruta para realizar actualizacones y defradaciones en la base de datos.
version: 1,
);


Future<List<Dog>> dogs() async {
  // Obtiene una referencia de la base de datos
  final Database db = await database;

  // Consulta la tabla por todos los Dogs.
  final List<Map<String, dynamic>> maps = await db.query('usuario');

  // Convierte List<Map<String, dynamic> en List<Dog>.
  return List.generate(maps.length, (i) {
    return Dog(
        nombre: maps[i]['nombre'],
        apellidos: maps[i]['apellidos'],
        username: maps[i]['username'],
        email: maps[i]['email'],
        contrasena: maps[i]['contrasena']

    );
  });
}
class funciones {

  Future<void> insertDog(Dog dog) async {
    // Obtiene una referencia de la base de datos
    final Database db = await database;

    // Inserta el Dog en la tabla correcta. También puede especificar el
    // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
    // En este caso, reemplaza cualquier dato anterior.
    await db.insert(
      'usuario',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> updateDog(Dog dog) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Actualiza el Dog dado
    await db.update(
      'usuario',
      dog.toMap(),
      // Aseguúrate de que solo actualizarás el Dog con el id coincidente
      where: "username = ?",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [dog.username],
    );
  }
  Future<void> deleteDog(String username) async {
    // Obtiene una referencia de la base de datos
    final db = await database;

    // Elimina el Dog de la base de datos
    await db.delete(
      'usuario',
      // Utiliza la cláusula `where` para eliminar un dog específico
      where: "username = '?'",
      // Pasa el id Dog a través de whereArg para prevenir SQL injection
      whereArgs: [username],
    );
  }
}
void main() async {
  funciones f = new funciones();

  var fido = Dog(
      nombre: 'Juan',
      apellidos: 'Martinez Torres',
      username: 'Jcarlos',
      email: 'juan.tecvalles.mx',
      contrasena: '12345678'
  );
  f.insertDog(fido);

  // Inserta un dog en la base de datos
  await insertDog(fido);

  // Imprime la lista de dogs (solamente Fido por ahora)
  print(await dogs());
  // Actualiza la edad de Fido y lo guarda en la base de datos
  fido = Dog(
    nombre: fido.nombre,
    apellidos: fido.apellidos,
    username: fido.username,
    email: 'juan098@gmail.com',
    contrasena: fido.contrasena,
  );


  // Imprime la información de Fido actualizada
  print(await dogs());

  // Elimina a Fido de la base de datos
  await deleteDog(fido.username);

  // Imprime la lista de dos (vacía)
  print(await dogs());
}

class Dog {
  final String nombre;
  final String apellidos;
  final String username;
  final String email;
  final String contrasena;

  Dog({this.nombre, this.apellidos, this.username, this.email, this.contrasena});

  Map<String, dynamic> toMap() {
    return {
      'Nombre': nombre,
      'Apellidos': apellidos,
      'Username': username,
      'email': email,
      'contrasena': contrasena,
    };
  }

  // Implementa toString para que sea más fácil ver información sobre cada perro
  // usando la declaración de impresión.
  @override
  String toString() {
    return 'Dog{Nombre: $nombre, Apellidos: $apellidos, Username: $username, email: $email, contrasena: $contrasena}';
  }
}

*/