import 'package:flutter/material.dart';
import 'package:flutter_application_8_base_datos/db/db_admin.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      // recubriendo colunm con center para centrar contenido
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DBAdmin.db.initDatabase();
              }, 
              child: Text('mostrar data'),
            ),
          ],
        ),
      ),
    );
    
  }
}
