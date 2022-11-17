import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// creando instancia 
class DBAdmin{
  // si el objeto quiere aceptar datos nulos, se le agrega un signo de interrogacion 
Database? myDatabase;
// instancia de la misma clase para reutilizarla
static final DBAdmin db = DBAdmin._();
// constructor que permite instanciar a la misma base de datos 
DBAdmin._();

// metodo qu permite verificar la existencia de la base de datos 
Future <Database?> checkdatabase() async{
  if(myDatabase != null){
    return myDatabase;
  }
 //crear la base de datos
  myDatabase = await initDatabase();
  return myDatabase;
}
// metodo que permite crear la base de datos 
// programacion asincrona 

Future <Database> initDatabase() async {
  Directory directory = await getApplicationDocumentsDirectory();
   // esta es una funcion asincrona 
  String path = join(directory.path, 'TaskDB.db');
  return await openDatabase(
    path,
    version: 1,
    onOpen: (db) {},
    onCreate: (Database dbx, int version) async{
      await dbx.execute(
        'CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, status TEXT)');
    },
  );
 }
}